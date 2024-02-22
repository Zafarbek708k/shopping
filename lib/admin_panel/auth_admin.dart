import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'all_function.dart';

class AdminAuth extends StatefulWidget {
  const AdminAuth({super.key});
   static const String id  = "/admin_panel";

  @override
  State<AdminAuth> createState() => _AdminAuthState();
}

class _AdminAuthState extends State<AdminAuth> {
  static const String _email = "karimov@gmail.com";
  static const String _password = "123456789";
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool passwordIsVisible = false;
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 162, 155),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              SvgPicture.asset(
                "assets/svg_files/Security_admin.svg",
                fit: BoxFit.cover,
                width: 250,
                height: 200,
              ),

              const SizedBox(height: 25),

              /// Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: TextField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                      // Enable or disable the button based on the length of the input
                      isButtonEnabled = value.length > 3;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  style: TextStyle(color: emailController.text.length <= 3 ? Colors.red : Colors.black),
                ),
              ),

              /// password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: passwordIsVisible ? const Icon(Icons.visibility, color: Colors.black,) : const Icon(Icons.visibility_off, color: Colors.black,),
                      onPressed: () {
                        setState(() {
                          passwordIsVisible = !passwordIsVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  obscureText: !passwordIsVisible,
                ),
              ),

              // Login Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: ElevatedButton(
                  onPressed: isButtonEnabled ? () => _handleLogin() : null,
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    // Check if email and password match the predefined values
    if (emailController.text == _email && passwordController.text == _password) {
      // Navigate to the next page
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => const AllFunction(),));
    } else {
      // Show error message and highlight text fields
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('This admin does not exist'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
