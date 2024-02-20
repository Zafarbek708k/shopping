import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/services/auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const String id = "/sign_up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool passwordIsVisible = false;
  bool passwordIsVisible2 = false;
  bool _passwordMatch = true;
  bool _agreedToTerms = false;
  bool isButtonEnabled = false;


  bool checkControllersValues() {
    return nameController.text.length > 3 &&
        emailController.text.length > 3 &&
        phoneNumberController.text.length > 3 &&
        passwordController.text.length > 3 &&
        confirmPasswordController.text.length > 3;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade800,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 35),
            SvgPicture.asset(
              "assets/svg_files/Privacy policy-Register.svg",
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),

            const SizedBox(height: 10.0),
            const Text('Register \nEnter your details to register', style: TextStyle(fontSize: 20, color: Colors.white), ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 7),
              child: TextField(
                controller: nameController,
                onChanged: (value) {
                  setState(() {
                    // Enable or disable the button based on the length of the input
                    isButtonEnabled = value.length > 3;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: 'e.g., Alex',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
                style: TextStyle(color: nameController.text.length <= 3 ? Colors.red : Colors.black),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 7),
              child: TextField(
                controller: emailController,
                onChanged: (value) {
                  setState(() {
                    // Enable or disable the button based on the length of the input
                    isButtonEnabled = value.length > 3;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.black),
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
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
                style: TextStyle(color: emailController.text.length <= 3 ? Colors.red : Colors.black),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7),
              child: TextField(
                controller: phoneNumberController, // You need to provide a controller
                onChanged: (value) {
                  setState(() {
                    // Enable or disable the button based on the length of the input
                    isButtonEnabled = value.length > 3;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: 'e.g., +998 90 123 45 67',
                  prefixIcon: const Icon(Icons.phone),
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
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
                keyboardType: TextInputType.phone,
                style: TextStyle(color: phoneNumberController.text.length <= 3 ? Colors.red : Colors.black),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.black),
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
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
                obscureText: !passwordIsVisible,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7),
              child: TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: 'e.g., Z7z2pjEx',
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: passwordIsVisible2 ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        passwordIsVisible2 = !passwordIsVisible2;
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
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  errorText: !_passwordMatch ? 'Passwords do not match' : null,
                ),
                obscureText: !passwordIsVisible2,
                onChanged: (value) {
                  setState(() {
                    _passwordMatch = value == passwordController.text;
                  });
                },
              ),
            ),


            Row(
              children: [
                Checkbox(
                  value: _agreedToTerms,
                  onChanged: checkControllersValues() // Ensure this returns a boolean value
                      ? (value) {
                    setState(() {
                      _agreedToTerms = value!;
                    });
                  }
                      : null, // Disable the checkbox if necessary conditions are not met
                ),
                const Text('I agree with the terms and conditions'),
              ],
            ),

            Visibility(
              visible: _agreedToTerms, // Show the button only if terms are agreed to
              child: MaterialButton(
                onPressed: _passwordMatch
                    ? () async {
                  if (_agreedToTerms && _passwordMatch) {
                    String name = nameController.text;
                    String email = emailController.text;
                    String phoneNumber = phoneNumberController.text;
                    String password = passwordController.text;
                    await AuthService.registerUser(context, fullName: name, password: password, email: email, phoneNumber: phoneNumber);
                  }
                }
                    : null,
                color: _passwordMatch ? Colors.cyan : Colors.grey, // Button color based on password match condition
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('Register'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
