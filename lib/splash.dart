import 'dart:async';
import 'package:afyasasa/root.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:afyasasa/auth.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 2;
  final FirebaseMessaging _messaging = FirebaseMessaging();
  final db = Firestore.instance;
  CollectionReference tokenReference;


  @override
  void initState() {
    super.initState();

    _pushToken();
    _loadWidget();
   
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  //TO-DO: Check if token already exists 
  _pushToken() async{
    _messaging.getToken().then((token){
      tokenReference = db 
      .collection("pushTokens");

      tokenReference.add({
        "deviceToken": token,
      });

    });
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => new Root(auth: new Auth())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/splash.png',
                        height: 200,
                        width: 300,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  )),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //CircularProgressIndicator(),
                      Container(
                        height: 10,
                      ),
                      Spacer(
                        flex: 4,
                      ),
                      Text('from'),
                      Text('PLUGIN.KE'),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}