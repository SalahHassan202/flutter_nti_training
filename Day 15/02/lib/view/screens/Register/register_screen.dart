import 'dart:convert';
import 'dart:io';
import 'package:app123/cubit/cubit/auth_cubit.dart';
import 'package:app123/cubit/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future<void> pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.camera);

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  Future<String> convertImageToBase64(File imageFile) async {
    List<int> bytes = await imageFile.readAsBytes();
    return base64Encode(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 234, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthRegisterSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Register Success")));
            }

            if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : null,
                      child: _image == null
                          ? const Icon(Icons.camera_alt, size: 35)
                          : null,
                    ),
                  ),

                  const SizedBox(height: 30),

                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 25),

                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              120,
                              238,
                              56,
                            ),
                          ),
                          onPressed: () async {
                            if (_image == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Pick Image First"),
                                ),
                              );
                              return;
                            }

                            String base64Image = await convertImageToBase64(
                              _image!,
                            );

                            // ignore: use_build_context_synchronously
                            context.read<AuthCubit>().register(
                              name: nameController.text,
                              email: emailController.text,
                              password: passController.text,
                              imageBase64: base64Image,
                            );
                          },
                          child: const Text("Register"),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
