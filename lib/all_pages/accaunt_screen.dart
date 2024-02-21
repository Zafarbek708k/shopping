import 'package:flutter/material.dart';

class MyAccauntSetting extends StatefulWidget {
  const MyAccauntSetting({super.key});

  @override
  State<MyAccauntSetting> createState() => _MyAccauntSettingState();
}

class _MyAccauntSettingState extends State<MyAccauntSetting> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor : Color.fromARGB(255, 40, 162, 155),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
    );
  }
}
