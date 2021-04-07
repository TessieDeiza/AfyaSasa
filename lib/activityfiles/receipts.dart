import 'package:flutter/material.dart';

class ReceiptsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyReceiptsPage(title: 'Verify Account'),
    );
  }
  
}

class MyReceiptsPage extends StatefulWidget {
  MyReceiptsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyReceiptsPageState createState() => _MyReceiptsPageState();

}

class _MyReceiptsPageState extends State<MyReceiptsPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', color: Color(0xFF00284B));
  final cardColor = Color(0xFF003B5B);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
     body: ListView(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Activity",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0, color: Color(0xFF00284B)),
                ),
              ]
            ),
          ),
 
        ],
      ),

    );

  }
  
}