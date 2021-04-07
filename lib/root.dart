import 'package:afyasasa/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:afyasasa/login.dart';
import 'package:afyasasa/auth.dart';

class Root extends StatefulWidget{
  Root({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootState();

}

enum AuthStatus{
  notSignedIn,
  signedIn,
}

class _RootState extends State<Root>{

  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
       _authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });

    });
  }

  void _signedIn() {
    setState(() {
      _authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      _authStatus = AuthStatus.notSignedIn;
    });
  }



  @override
  Widget build(BuildContext context) {
    switch (_authStatus){
      case AuthStatus.notSignedIn:
        return new MyLoginScreen(
          auth: widget.auth,
          signedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return new NavBar(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    } 
    
  }

}