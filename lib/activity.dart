import 'package:flutter/material.dart';
import 'package:afyasasa/activityfiles/all.dart' as first;
import 'package:afyasasa/activityfiles/receipts.dart' as second;
import 'package:afyasasa/activityfiles/receipts.dart' as third;
import 'package:afyasasa/activityfiles/receipts.dart' as fourth;


class MyActivity extends StatefulWidget{
  @override
  
  MyActivityState createState() => new MyActivityState();
}

class MyActivityState extends State<MyActivity> with SingleTickerProviderStateMixin{
  bool isSmall = false;
  
  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          centerTitle: true,
          leading: new IconButton(
            key: Key("userPicture"),
            icon: CircleAvatar(
              maxRadius: 60.0,
              // backgroundImage:AssetImage("url/here.jpg"),
              backgroundColor: Colors.amber,
            ),
            onPressed: () {
            },
          ),
          title: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                    Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Text("Activity ",
                        textAlign: TextAlign.left, 
                        style: TextStyle(fontFamily: 'SF Pro', color: Color(0xFF00284B), fontSize: 20.0, fontWeight: FontWeight.bold), 
                        ),
                      ],
                    ),
                    
                  ],
                  ),
                  IconButton(
                    icon: Icon(
                    Icons.settings,
                    color: Color(0xFFA3A3A3),
                  ), 
                  onPressed: null)

                  ],
                ),
                SizedBox(height:5.0)
                
              ],
            ),
          ),

          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: Container(
              
            child: Column(
              children: <Widget>[
                new TabBar(
                  controller: controller,
                  isScrollable: true,
                  labelStyle: TextStyle(color: Colors.black),
                  tabs: <Tab>[
                    new Tab(
                      child: Text("All",
                      style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF000000), fontSize: 14.0),),

                    ),
                    new Tab(
                      child: Text("Receipts",
                      style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF000000), fontSize: 14.0),),
                    ),
                    new Tab(
                      child: Text("Payment",
                      style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF000000), fontSize: 14.0),),
                    ),
                    new Tab(
                      child: Text("Message",
                      style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF000000), fontSize: 14.0),),
                    ),
                  ]
                )

              ],
              ),

          )
          )

        ),
      ),
      
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new first.AllActivityPage(),
          new second.ReceiptsPage(),
          new third.ReceiptsPage(),
          new fourth.ReceiptsPage(),
        ]
      )
    ),
    );
  }
}