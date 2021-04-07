
import 'package:afyasasa/userfiles/health.dart';
import 'package:afyasasa/userfiles/personal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:afyasasa/auth.dart';

class NavDrawer extends StatelessWidget{ 
  NavDrawer({this.auth,this.user, this.onSignedOut});
  final FirebaseUser user;
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
    print("reached drawer");
    print(user);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
          height: 150.0,
          child: DrawerHeader(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  //maxRadius: 40.0,
                  // backgroundImage:AssetImage("url/here.jpg"),
                  backgroundColor: Colors.amber,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("User", style: TextStyle(fontSize: 22.0),),
                    RichText(
                      key: Key("userProfile"),
                      text: TextSpan(
                        text: "View and Edit Profile",
                        style: TextStyle(color: Colors.blue[300]),
                        recognizer: TapGestureRecognizer()
                        ..onTap = (){
                           Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyPersonalInfoPage(user: user)));
                        }
                      )
                    ),
                    SizedBox(height: 5.0),
                    Text("100% profile completed", style: TextStyle(color: Colors.green[300]))
                  ],
                ),
                Icon(Icons.keyboard_arrow_right)
              ]
            ),   
            // decoration: BoxDecoration(
            //     color: Colors.green,
            //     image: DecorationImage(
            //         fit: BoxFit.fill,
            //         image: AssetImage('assets/image.jpg')
            //         )),
          ),
          ),
          Subscription(),
          Container(
            color: Colors.grey[200], 
            height: 10.0,
          ),
          DrawerMenu(
            Icons.receipt, 
            "My Appointments", 
            () => {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyPersonalInfoPage(user: user))),
            },
          ),
          DrawerMenu(
            Icons.local_hospital, 
            "Lab", 
            () => {
              Navigator.of(context).pop()
            },
          ),
          DrawerMenu(
            Icons.shopping_basket, 
            "Orders", 
            () => {
              Navigator.of(context).pop()
            },
          ),
          DrawerMenu(
            Icons.call, 
            "Consultations", 
            () => {
              Navigator.of(context).pop()
            },
          ),
          DrawerMenu(
            Icons.person, 
            "My Doctors", 
            () => {
              Navigator.of(context).pop()
            },
          ),
          DrawerMenu(
            Icons.healing, 
            "Medical Record", 
            () => {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new HealthPage())),
            },
          ),
          DrawerMenu(
            Icons.monetization_on, 
            "Payments", 
            () => {
              Navigator.of(context).pop()
            },
          ),
          DrawerMenu(
            Icons.timer, 
            "Reminders", 
            () => {
              Navigator.of(context).pop()
            },
          ),
          Container(
            color: Colors.grey[200], 
            height: 10.0,
          ),
          DrawerMenu(
            Icons.help_outline, 
            "Help Center", 
            () => {
              Navigator.of(context).pop()
            },
          ),
          DrawerMenu(
            Icons.settings, 
            "Settings", 
            () => {
              Navigator.of(context).pop()
            },
          ),
          // DrawerMenu(
          //   Icons.exit_to_app, 
          //   "Logout", 
          //   () => {
          //     _signOut()
          //   },
          // ),
        ],
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget{

  IconData icon;
  String text;
  Function onTap;

  DrawerMenu(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 8.0,16.0, 8.0 ),
                    child: Text(text)
                  )
                ],

              ),
              Icon(Icons.keyboard_arrow_right)
          ],),
        )
      )
    );
  }
}

class Subscription extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
        child: InkWell(
          onTap: (){},
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.0),
                      child: RichText(
                      text: TextSpan(text: "Afya ",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,),
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFFFC670C),
                            ),
                            padding: EdgeInsets.all(4.0),
                            child: Text("PLUS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10.0)),
                          )
                        )
                      ],
                      ),
                    ),
                    ),
                    Text("Your health plan"),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right)
              ]
            )
          ),
        ),
    );
  }
}