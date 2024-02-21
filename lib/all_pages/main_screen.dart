import 'package:flutter/material.dart';

import '../widgets/custom_driwer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text("BackButton "),
              Text("All Products  "),
            ],
          ),
        ),
      ),
    );
  }
}
