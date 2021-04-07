import 'package:afyasasa/splash.dart';
import 'package:flutter/material.dart';


//app center intergration
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // final android = defaultTargetPlatform == TargetPlatform.android;

  // var appSecret = android ? "62819964-1595-42e7-b7b8-dfe74597c2a0" : "6309b40d-b8a8-45b5-8fa1-aafb1d686c1b";
  // await AppCenter.start(appSecret, [AppCenterAnalytics.id, AppCenterCrashes.id]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}