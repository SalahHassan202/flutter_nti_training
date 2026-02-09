import 'package:flutter/material.dart';
import 'package:splach_app/core/widgets/custom_text_form_feild_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 170, 211),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 221, 236),
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                label: "Username",
                icon: Icons.person,
                controller: userController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Username is required";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Email",
                icon: Icons.email_outlined,
                controller: emailController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Email is required";
                  }
                  if (v.length < 8) {
                    return "Email should be Found";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              CustomTextField(
                label: "Phone Number",
                icon: Icons.phone,
                controller: phoneController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Phone is required";
                  }
                  if (v.length < 8) {
                    return "phone should be more than 11 chars";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              CustomTextField(
                label: "Password",
                icon: Icons.lock,
                isPassword: true,
                controller: passController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Password is required";
                  }
                  if (v.length < 8) {
                    return "Password should be more than 8 chars";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
