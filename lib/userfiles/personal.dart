import 'package:afyasasa/home.dart';
import 'package:afyasasa/widgets/nav-drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ThemeData userTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.black,
    primaryColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 12.0,
      ),
    ),
  );
}

class MyPersonalInfoPage extends StatefulWidget {
  MyPersonalInfoPage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _MyPersonalInfoPage createState() => _MyPersonalInfoPage();

}

class _MyPersonalInfoPage extends State<MyPersonalInfoPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', color: Color(0xFF00284B));
  final cardColor = Color(0xFF003B5B);
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  

  @override
  Widget build(BuildContext context){
    print(widget.user);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: NavDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            child: Container(
              color: Colors.grey, 
              height: 0.5,), 
              preferredSize: Size.fromHeight(4.0)
          ),
          leading: new IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomeScreen() )),
            }
          ),
          title: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text("My Profile",
                  textAlign: TextAlign.left, 
                  style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF00284B), fontSize: 20.0, fontWeight: FontWeight.bold), 
                  ),
                SizedBox(height:5.0)
              ],
            ),
          ),
        ),
      ),
      
      body: ListView(
        children: <Widget>[
          
          Container(
            margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: cardColor, width: 1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Basic Info"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              new InkWell(
                // onTap: () {},
                child: new Theme(
                data: userTheme(),
                  child: TextField(
                      key: Key("name"),
                      style: style,
                      decoration: InputDecoration(
                        labelText: 'Name:',
                        suffixIcon: Icon(Icons.arrow_forward_ios)
                      ),
                    ),
                )
              ),
              new InkWell(
                // onTap: () {},
                child: new Theme(
                data: userTheme(),
                  child: TextField(
                      key: Key("date_of_birth"),
                      style: style,
                      decoration: InputDecoration(
                        labelText: 'Date Of Birth:',
                        suffixIcon: Icon(Icons.arrow_forward_ios)
                      ),
                    ),
                )
              ),
              new InkWell(
                // onTap: () {},
                child: new Theme(
                data: userTheme(),
                  child: TextField(
                      key: Key("gender"),
                      style: style,
                      decoration: InputDecoration(
                        labelText: 'Gender:',
                        suffixIcon: Icon(Icons.arrow_forward_ios)
                      ),
                    ),
                )
              ),
            ],
          ),
          ),
          
          Container(
            margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: cardColor, width: 1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Contact Info"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              new InkWell(
                // onTap: () {},
                child: new Theme(
                data: userTheme(),
                child: Text("Number",
                            key: Key("contact_number"),),
                  // child: TextField(
                  //   controller: _controller.text,
                  //   style: style,
                  //   decoration: InputDecoration(
                  //     labelText: 'Phone:',
                  //     suffixIcon: Icon(Icons.arrow_forward_ios)
                  //   ),
                  // ),
                )
              ),
              new InkWell(
                // onTap: () {},
                child: new Theme(
                data: userTheme(),
                  child: TextField(
                      style: style,
                      decoration: InputDecoration(
                        labelText: 'E-mail:',
                        suffixIcon: Icon(Icons.arrow_forward_ios)
                      ),
                    ),
                )
              ),
            ],
          ),
          ),
          
          Container(
            margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: cardColor, width: 1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Security & Password"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              new InkWell(
                // onTap: () {},
                child: new Theme(
                data: userTheme(),
                  child: TextField(
                      style: style,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password:',
                        suffixIcon: Icon(Icons.arrow_forward_ios)
                      ),
                    ),
                )
              ),
              Row(
                children: <Widget>[
                  Text("Last Updated 00/00/00"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
            ],
          ),
          ),
          
        ],
      ),

    );

  }
  
}