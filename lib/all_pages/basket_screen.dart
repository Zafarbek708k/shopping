import 'package:flutter/material.dart';

import '../widgets/custom_driwer.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor : const Color.fromARGB(255, 40, 162, 155),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 70, 162, 155),
      ),


      drawer:   CustomDrawer(),

      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("CRUD"),
            ],
          ),
        ),
      ),
    );
  }
}
