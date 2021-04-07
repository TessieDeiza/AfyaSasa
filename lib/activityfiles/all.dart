import 'package:flutter/material.dart';

class AllActivityPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAllActivityPage(title: 'Verify Account'),
    );
  }
  
}

class MyAllActivityPage extends StatefulWidget {
  MyAllActivityPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAllActivityPageState createState() => _MyAllActivityPageState();

}

class _MyAllActivityPageState extends State<MyAllActivityPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', color: Color(0xFF00284B));
  final cardColor = Color(0xFF003B5B);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
     body: ListView(
        children: <Widget>[

          Container(
            margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Confirmed Payment"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Text("Online Consultation:"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("KES 1,500.00"),
                  Spacer(),
                  Text("15/04/2020"),
                  Spacer(),
                  Text("04:39PM"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Wellbaby Vaccine:"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("KES 2,500.00"),
                  Spacer(),
                  Text("15/04/2020"),
                  Spacer(),
                  Text("06:34PM"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Home Visit:"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("KES 6,000.00"),
                  Spacer(),
                  Text("15/04/2020"),
                  Spacer(),
                  Text("10:19AM"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),

              //Order
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Text("Notifications"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Text("Order Confirmed:"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Ref:GJH1766 "),
                  Spacer(),
                  Text("15/04/2020"),
                  Spacer(),
                  Text("04:39PM"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Order Sent:"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Ref: HKH8980"),
                  Spacer(),
                  Text("15/04/2020"),
                  Spacer(),
                  Text("06:34PM"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Order Cancelled:"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Ref: HKHK1798"),
                  Spacer(),
                  Text("15/04/2020"),
                  Spacer(),
                  Text("10:19AM"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),

              //Messages

              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Text("Messages"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Text("Received:"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Hello... "),
                  Spacer(),
                  Text("15/04/2020"),
                  Spacer(),
                  Text("04:39PM"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Sent:"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Check..."),
                  Spacer(),
                  Text("15/04/2020"),
                  Spacer(),
                  Text("06:34PM"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),
              
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Unread:"),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Text("Please..."),
                  Spacer(),
                  Text("15/04/2020"),
                  Spacer(),
                  Text("10:19AM"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  Padding(padding:EdgeInsets.all(8.0)),
                ],
              ),
              Padding(
              padding:EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child:Container(
              height:1.0,
              color:Colors.black,),),

              
              ],
              
          ),
          ),
          
 
        ],
      ),

    );

  }
  
}