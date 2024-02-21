import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/services/auth_service.dart'; // Import flutter_svg

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = "/sign_in";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool passwordIsVisible = false;
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade800,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              SvgPicture.asset(
                "assets/svg_files/login_svg_bcg.svg",
                fit: BoxFit.cover,
                width: 200,
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
                    hintText: 'e.g., example@gmail.com',
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
                    hintText: 'e.g., Z7z2pjEX',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: passwordIsVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
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

              /// forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/sign_up");
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ],
              ),

              /// Sign in Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: MaterialButton(
                  onPressed: () async{
                    String email = emailController.text;
                    String password = passwordController.text;
                    await AuthService.loginUser(context, email: email, password: password);
                  },
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(7.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(83, 79, 79, 1.0),
                    ),
                  ),
                ),
              ),

              ///  text  Sign in with google and facebook
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text(
                  "or Sign in with ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),

              /// Buttons google and facebook
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () async{
                      /// Login with Google
                     User? user =  await AuthService.signInWithGoogle();
                     if( user != null){
                       Navigator.pushReplacementNamed(context, "/first_page");
                     }else{
                       ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(
                           content: Text('Google bilan kirishda xatolik yuz berdi. Iltimos, qayta urinib ko\'ring.'),
                         ),
                       );
                     }
                    },
                    color: Colors.white,
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.g_mobiledata_sharp,
                          color: Color.fromRGBO(83, 79, 79, 1.0),
                        ),
                        SizedBox(width: 10), // Adding space between icon and text
                        Text(
                          'Google',
                          style: TextStyle(
                            color: Color.fromRGBO(83, 79, 79, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 25),
                  MaterialButton(
                    onPressed: () {
                      /// Login with Facebook
                    },
                    color: Colors.white,
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Color.fromRGBO(83, 79, 79, 1.0),
                        ),
                        SizedBox(width: 10), // Adding space between icon and text
                        Text(
                          'Facebook',
                          style: TextStyle(
                            color: Color.fromRGBO(83, 79, 79, 1.0),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                    child: TextButton(
                      onPressed: () {
                       Navigator.pushNamed(context, "/sign_up");
                      },
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white, // Default color for the text
                          ),
                          children: [
                            TextSpan(
                              text: 'No Account? ',
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: Color.fromRGBO(12, 255, 255, 1.0), // Color for "Sign Up"
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
