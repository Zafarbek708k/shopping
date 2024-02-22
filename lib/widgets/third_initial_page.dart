import 'package:flutter/material.dart';
import 'package:shopping/services/extension_service.dart';

class ThirdInitialPage extends StatefulWidget {
  const ThirdInitialPage({Key? key}) : super(key: key);

  @override
  State<ThirdInitialPage> createState() => _ThirdInitialPageState();
}

class _ThirdInitialPageState extends State<ThirdInitialPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "assets/images/location_intro.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 25),
              Text("location".tr, style: const TextStyle(color: Colors.white, fontSize: 20),),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    height: 40,
                    minWidth: 100,
                    color: Colors.white24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/sign_in");
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 5,),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }


}
