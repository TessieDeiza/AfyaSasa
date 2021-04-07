import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:afyasasa/dashboard.dart';
import 'package:afyasasa/verify_user.dart';


abstract class BaseAuth {
  Future registerUser(String mobile, BuildContext context);
  Future<String> currentUser();
  Future<void> signOut();
  
}

class Auth implements BaseAuth{
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCredential _credential;
  String verId;

  Future registerUser(String mobile, BuildContext context) async{
    print("reached register user");
    print(mobile);
    

    _auth.verifyPhoneNumber(
      phoneNumber: mobile, 
      timeout: Duration(seconds: 120),
      verificationCompleted: (AuthCredential authCredential){
        print("verificationCompleted....");
        _auth.signInWithCredential(_credential).then((AuthResult result){
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=>NavBar()));
        }).catchError((e){
          print(e);
        });
      }, 
      codeAutoRetrievalTimeout: (String verificationId){
        print("reached auto retrival....");
        this.verId = verificationId;
      },
      codeSent: (String verificationId, [int forceResendingToken]){
        print("reached code sent....");
        Navigator.push(context,
          MaterialPageRoute(builder: (context)=>MyVerifyUserPage( verificationId : verificationId, phoneNo: mobile )));
      },
      
      verificationFailed: (AuthException authException){
        print("failed");
        print(authException.message);
      },
      
    );
  }

  Future<String> currentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user.uid;
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }
}