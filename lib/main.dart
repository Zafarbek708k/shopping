import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping/admin_panel/auth_admin.dart';
import 'package:shopping/all_pages/first_menu.dart';
import 'package:shopping/authentication/sign_in.dart';
import 'package:shopping/authentication/sign_up.dart';
import 'authentication/auth_gate.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Corrected the key parameter here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthGate(),
      routes: {
        "/sign_in": (context) => const SignIn(),
        "/sign_up": (context) => const SignUp(),
        "/admin_panel": (context) => const AdminAuth(),
        "/first_page": (context) => const FirstMenu(),
      },
    );
  }
}
