import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountSetting extends StatefulWidget {
  const MyAccountSetting({Key? key}) : super(key: key);

  @override
  State<MyAccountSetting> createState() => _MyAccauntSettingState();
}

class _MyAccauntSettingState extends State<MyAccountSetting> {

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  // Add functionality for My Profile button
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.person_3_outlined), // Replace 'icon_name' with the actual icon you want to use
                    SizedBox(width: 5), // Add some spacing between icon and text
                    Text(
                      'My Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_right_sharp)
                  ],
                ),
              ),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  // Add functionality for My Profile button
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.notification_important_outlined, color: Colors.black,), // Replace 'icon_name' with the actual icon you want to use
                    SizedBox(width: 5), // Add some spacing between icon and text
                    Text(
                      'Notification',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_right_sharp)
                  ],
                ),
              ),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  // Add functionality for My Profile button
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(CupertinoIcons.globe, color: Colors.black,), // Replace 'icon_name' with the actual icon you want to use
                    SizedBox(width: 5), // Add some spacing between icon and text
                    Text(
                      '     Til    ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_right_sharp)
                  ],
                ),
              ),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  // Add functionality for My Profile button
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(CupertinoIcons.location_solid, color: Colors.black,), // Replace 'icon_name' with the actual icon you want to use
                    SizedBox(width: 5), // Add some spacing between icon and text
                    Text(
                      ' Location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_right_sharp)
                  ],
                ),
              ),

            ],
          ),
        ),
      );

  }
}
