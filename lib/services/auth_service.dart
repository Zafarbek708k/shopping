import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      static Future<User?> signInWithGoogle()async{
          GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
          if(googleSignInAccount != null){
            GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
            OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
              accessToken: googleSignInAuthentication.accessToken,
              idToken: googleSignInAuthentication.idToken
            );

            UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
            return userCredential.user;
          }else{
            return null;
          }


      }


  static Future<User?> updateProfileUser(BuildContext context, {String? fullName, String? email, String? password, String? phoneNumber}) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Re-authenticate user if password is provided
        if (password != null) {
          await _auth.currentUser!.reauthenticateWithCredential(
            EmailAuthProvider.credential(email: user.email!, password: password),
          );
        }

        // Update profile fields
        if (fullName != null) {
          await user.updateDisplayName(fullName);
        }
        if (email != null) {
          await user.updateEmail(email);
        }
        if (phoneNumber != null) {

        }

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Ma'lumotlar muvaffaqiyatli yangilandi")));
        return user;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Foydalanuvchi ma'lumotlarini yangilashda xatolik yuz berdi. Iltimos, qayta urinib ko'ring.")));
        return null;
      }
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Xatolik yuz berdi")));
      return null;
    }
  }





}


