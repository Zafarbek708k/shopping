import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/auth_service.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key,});
  bool value = true;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
             color: Color.fromARGB(255, 30, 162, 155),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async{
              await AuthService.logOut(context);
              if (Platform.isAndroid || Platform.isIOS) {
                Navigator.pushReplacementNamed(context, "/sign_in");
              } else {
                exit(0);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete Account'),
            onTap: () async{
              await AuthService.deleteAccount(context);
              if (Platform.isAndroid || Platform.isIOS) {

                SystemNavigator.pop();
              } else {
                exit(0);
              }
            },
          ),
        ],
      ),
    );
  }
}
