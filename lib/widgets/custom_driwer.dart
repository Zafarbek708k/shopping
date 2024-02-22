

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../admin_panel/auth_admin.dart';
import '../services/auth_service.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String _selectedLanguage = 'English'; // Initial language
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 31, 237, 226),
      shadowColor: Colors.black,
      width: 250,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 30, 162, 155),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 CircleAvatar(
                   radius: 50,
                 ),
                 Text("Name"),
               ],
                                ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color:  Colors.black,),
            title: const Text('Logout'),
            onTap: () async {
              await AuthService.logOut(context);
              if (Platform.isAndroid || Platform.isIOS) {
                Navigator.pushReplacementNamed(context, "/sign_in");
              } else {
                exit(0);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.black,),
            title: const Text('Delete Account'),
            onTap: () async {
              await AuthService.deleteAccount(context);
              if (Platform.isAndroid || Platform.isIOS) {
                SystemNavigator.pop();
              } else {
                exit(0);
              }
            },
          ),

          ListTile(
            leading:  const Icon(
              CupertinoIcons.globe,
              color: Colors.black,
              size: 30,
            ),
            title: const Text('Language'),
            onTap: () {
              Navigator.pop(context);
              showLanguageMenu(context);
            },
          ),

          ListTile(
            leading:  isDarkMode ? const Icon(
              Icons.light_mode,
              color: Colors.black ,
              size: 30,
            ):const Icon(Icons.dark_mode_outlined, color: Colors.black,),
            title: const Text('Light/Dark'),
            onTap: ()  {
              setState(() {
                isDarkMode = !isDarkMode;

              });
            },
          ),

          ListTile(
            leading: const Icon(Icons.person_2_outlined),
            title: const Text('Admin'),
            onTap: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminAuth(), // Bu yerda NextPage o'zgaruvchisi sizning keyingi sahifangiz
                ),
              );

            },
          ),



        ],
      ),
    );
  }

  void showLanguageMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  // Update selected language and close dialog
                  setState(() {
                    _selectedLanguage = 'English';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Uzbek'),
                onTap: () {
                  // Update selected language and close dialog
                  setState(() {
                    _selectedLanguage = 'Uzbek';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Russian'),
                onTap: () {
                  // Update selected language and close dialog
                  setState(() {
                    _selectedLanguage = 'Russian';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Back'),
                onTap: () {
                  // Close language selection dialog
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }


}
