import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_cash_user/model/user_data.dart';
import 'package:crypto_cash_user/screens/bottomnavbar.dart';
import 'package:crypto_cash_user/screens/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAuth {
  String statusMsg = "Account Created Successfully";
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  //To create new User
  Future<String> createUser(
      BuildContext context, String name, String email, String password) async {
    AuthResult authResult = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseUser signedInUser = authResult.user;
    if (signedInUser != null) {
      _firestore.collection('/users').document(signedInUser.uid).setData({
        'name': name,
        'email': email,
        'profileImageUrl': '',
        'bynaseAmt': 0,
        'bitcoinAmt': 0,
        'ethereumAmt': 0,
        'litecoinAmt': 0,
        'bitbotAmt': 0,
        'rippleAmt': 0,
        'cardanoAmt': 0,
        'stellarAmt': 0,
        'zainAmt': 0,
        'moneroAmt': 0,
      });
      Provider.of<UserData>(context).currentUserId = signedInUser.uid;
      String currentUserId = signedInUser.uid;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  BottomNavBar(currentUserId: currentUserId)));
    }

    return statusMsg;
  }

  static void logout(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SplashScreen()));
  }

  //To verify new User
  Future<String> verifyUser(
      BuildContext context, String email, String password) async {
    AuthResult authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser signedInUser = authResult.user;
    Provider.of<UserData>(context).currentUserId = signedInUser.uid;
    String currentUserId = signedInUser.uid;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BottomNavBar(currentUserId: currentUserId),
      ),
    );
    return "Login Successfull";
  }
}
