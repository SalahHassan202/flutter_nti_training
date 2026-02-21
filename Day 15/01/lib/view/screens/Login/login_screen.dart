import 'package:app123/cubit/cubit/auth_cubit.dart';
import 'package:app123/cubit/cubit/auth_state.dart';
import 'package:app123/view/screens/Register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text("Login"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoginSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Login Success")));
              }

              if (state is AuthError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return Center(
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: "Email"),
                    ),

                    SizedBox(height: 15),

                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                    ),

                    SizedBox(height: 25),

                    state is AuthLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              context.read<AuthCubit>().login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            },
                            child: Text("Login"),
                          ),

                    SizedBox(height: 15),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => RegisterScreen()),
                        );
                      },
                      child: Text("Register"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
