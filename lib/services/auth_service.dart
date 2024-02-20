import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthService{
  static final _auth =FirebaseAuth.instance;

  /// Register

    static Future<User?> registerUser(BuildContext context, {required String fullName, required String email, required String password, required String phoneNumber})async{

      UserCredential userCredential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      try{
        if(userCredential.user != null){
          /// qo'shimcha fieldlarni kiritish (name, phone number and another)
          await  userCredential.user!.updateDisplayName(fullName);
          await userCredential.user!.updateDisplayName(phoneNumber);
          /// shu tariqa necha bo'lsa ham qoshib ketiladi
          //Navigator.pushReplacementNamed(context, "") home Pagega o'tish kerak

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully Registered")));

          return userCredential.user;
        }else{
          return null;
        }
      }catch(e){
        log(e.toString());
      }

    }


      /// Login
          static  Future<User?> loginUser(BuildContext context, {required String email, required String password})async{
          UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
            if(userCredential.user != null){
              /// Navigator to home page
              return userCredential.user;
            }else{
              return null;
            }
          }

      /// log Out
        static Future<void> logOut(BuildContext context) async {
          try {
            await _auth.signOut();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("You have been logged out successfully"),
            ));
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Failed to log out. Please try again later."),
            ));
          }
        }


      /// Delete Account
      static Future<void> deleteAccount(BuildContext context) async {
        try {
          await _auth.currentUser?.delete();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Your account has been deleted successfully"),
          ));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Failed to delete account. Please try again later."),
          ));
        }
      }

      /// login with google
      static Future<User?> loginWithGoogle(BuildContext context)async{

      }



      /// and another function

}