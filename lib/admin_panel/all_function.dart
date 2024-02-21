import 'package:flutter/material.dart';

class AllFunction extends StatefulWidget {
  const AllFunction({super.key});

  @override
  State<AllFunction> createState() => _AllFunctionState();
}

class _AllFunctionState extends State<AllFunction> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 162, 155),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///  Button Navigator.push list of Users
            ///  Button Navigator.push list of Products
          ],
        ),
      ),
    );
  }
}
