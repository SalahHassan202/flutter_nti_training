import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final nameController = TextEditingController();
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
          title: Text("Register"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),

                SizedBox(height: 15),

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

                ElevatedButton(
                  onPressed: () {
                    print("Register Clicked");
                  },
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
