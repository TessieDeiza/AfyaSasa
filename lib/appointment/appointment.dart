import 'package:flutter/material.dart';
import 'package:afyasasa/appointment/make_appointment.dart' as first;
import 'package:afyasasa/appointment/about.dart' as second;


class MyAppointment extends StatefulWidget{
  @override
  
  MyAppointmentState createState() => new MyAppointmentState();
}

class MyAppointmentState extends State<MyAppointment> with SingleTickerProviderStateMixin{
  bool isSmall = false;
  
  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(vsync: this, length: 2);
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
        preferredSize: Size.fromHeight(130.0),
        child: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.0),
            child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  //height: 150.0,
                  margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 1.0)
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child:Container(
                          //color: Colors.black,
                          margin: EdgeInsets.all(8.0),
                          //child: Image.asset("svg/mask.svg"),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[Icon(Icons.person),],
                          )
                        ),
                      ),
                      //SizedBox(height: 10.0),
                      Expanded(
                        flex: 3,
                        child:Container(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Dr Ruth Ndanu", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("General Practitioner"),
                              Text( "(0 Reviews)"),
                            ],
                          )
                        ),
                      ),
                      //SizedBox(height: 10.0),
                      Expanded(
                        flex: 1,
                        child:Container(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              IconButton(icon: Icon(Icons.bookmark), onPressed: null),
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                new TabBar(
                  controller: controller,
                  labelStyle: TextStyle(color: Colors.black),
                  tabs: <Tab>[
                    new Tab(
                      child: Text("Appointment",
                      style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF000000), fontSize: 14.0),),

                    ),
                    new Tab(
                      child: Text("About",
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
          new first.MyMakeAppointmentPage(),
          new second.MyAboutPage(),
        ]
      )
    ),
    );
  }
}