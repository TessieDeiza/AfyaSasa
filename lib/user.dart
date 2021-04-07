import 'package:flutter/material.dart';
import 'package:afyasasa/userfiles/personal.dart' as first;
import 'package:afyasasa/userfiles/health.dart' as second;
import 'package:afyasasa/userfiles/payment.dart' as third;
import 'package:afyasasa/userfiles/subscription.dart' as fourth;


class MyUserTabs extends StatefulWidget{
  @override
  
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyUserTabs> with SingleTickerProviderStateMixin{
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
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: Container(
              
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  // backgroundImage:AssetImage("url/here.jpg"),
                  backgroundColor: Colors.amber,
                ),
                Text("User Name",
                  //textAlign: TextAlign.left,
                  style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF00284B), fontSize: 14.0), 
                ),
                Text("User ID: xxxxxxx",
                  //textAlign: TextAlign.left, 
                  style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF00284B), fontSize: 14.0), 
                ),
                new TabBar(
                  controller: controller,
                  isScrollable: true,
                  labelStyle: TextStyle(color: Colors.black),
                  tabs: <Tab>[
                    new Tab(
                      child: Text("Personal",
                      style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF000000), fontSize: 14.0),),

                    ),
                    new Tab(
                      child: Text("Health",
                      style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF000000), fontSize: 14.0),),
                    ),
                    new Tab(
                      child: Text("Payment",
                      style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF000000), fontSize: 14.0),),
                    ),
                    new Tab(
                      child: Text("Subscription",
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
          new first.MyPersonalInfoPage(),
          new second.HealthPage(),
          new third.PaymentPage(),
          new fourth.SubscriptionPage()
        ]
      )
    ),
    );
  }
}