import 'package:flutter/material.dart';

import '../widgets/custom_driwer.dart';

class MyAccauntSetting extends StatefulWidget {
  const MyAccauntSetting({super.key});

  @override
  State<MyAccauntSetting> createState() => _MyAccauntSettingState();
}

class _MyAccauntSettingState extends State<MyAccauntSetting> {
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
              Text("BackButton "),
              Text("My Profile "),
              Text("IconButton(camera)  circle avatar right button "),
              Text("name"),
              Text("Button(My Account)"),
              Text("Button(Notification)"),
              Text("Button(Location)"),
              Text("Button(Help Center)"),
            ],
          ),
        ),
      ),
    );
  }
}
