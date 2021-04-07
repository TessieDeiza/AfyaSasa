import 'package:flutter/material.dart';
import 'package:afyasasa/auth.dart';

class Logout extends StatelessWidget{
  Logout({this.auth, this.onSignedOut});

  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void _signOut() async {
    try{
      await auth.signOut();
      onSignedOut();
    } catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            child: Container(
              color: Colors.grey, 
              height: 0.5,), 
              preferredSize: Size.fromHeight(4.0)
          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text("Settings",
                    textAlign: TextAlign.left, 
                    style: TextStyle(fontFamily: 'SF Pro', color: Color(0xFF00284B), fontSize: 20.0, fontWeight: FontWeight.bold), 
                    ),
                  ],
                ),
                
              ],
              ),

              ],
            ),
          ),
      ),
      body: ListView(
        children: <Widget>[
          Container()
        ],
      ),
    );
    
  }
}