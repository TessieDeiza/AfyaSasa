import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPaymentPage(title: 'Verify Account'),
    );
  }
  
}

class MyPaymentPage extends StatefulWidget {
  MyPaymentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPaymentPageState createState() => _MyPaymentPageState();

}

class _MyPaymentPageState extends State<MyPaymentPage> {
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
                  "User Payment",
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