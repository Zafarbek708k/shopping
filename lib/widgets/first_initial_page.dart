import 'package:flutter/material.dart';
import 'package:shopping/services/extension_service.dart';

class FirstInitialPage extends StatefulWidget {
  const FirstInitialPage({super.key});

  @override
  State<FirstInitialPage> createState() => _FirstInitialPageState();
}

class _FirstInitialPageState extends State<FirstInitialPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 162, 155),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  "assets/images/Online ads.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 25),
              Text("discount".tr, style: const TextStyle(color: Colors.white, fontSize: 25),),
              const SizedBox(height: 50),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
