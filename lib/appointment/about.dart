
import 'package:flutter/material.dart';
import 'package:afyasasa/widgets/expandabletext.dart';


class MyAboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAboutPageScreen()
    );
  }
}

class MyAboutPageScreen extends StatefulWidget {
  MyAboutPageScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAboutPageScreenState createState() => _MyAboutPageScreenState();

}

class _MyAboutPageScreenState extends State<MyAboutPageScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
   Widget build(BuildContext context){

     final text = 'What is Lorem Ipsum?\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s,when an unknown printer took a galley. of type and scrambled it to make a type specimen book It has survived not only five centuries, but also the leap';

     final services = 'Speciality Diagnostics Treatment\nPreventive Medicine\nDiabetes Management';

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
      children: <Widget>[
        SizedBox(height: 2.0),

        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "About",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00284B)),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.0),

        Container(
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ExpandableText(
              text,
              trimLines: 2,
            ),
          ]),
        ),
        SizedBox(height: 10.0),

        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Availability",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00284B)),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.0),

        //https://stackoverflow.com/questions/59312786/flutter-custom-toggle-buttons-selection
        Container(
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Today, 27 April 2020",
            textAlign: TextAlign.left,),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('7.00',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                  ),
                ),
                InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      //color: Colors.blueAccent[100],
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('8.00',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
                  ),
                ),
                InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      //color: Colors.blueAccent[100],
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('10.00',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  ),
                ),

                InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      //color: Colors.blueAccent[100],
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('13.00',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  ),
                ),

                InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      //color: Colors.blueAccent[100],
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('16.00',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  ),
                ),
              ],
            ),
            SizedBox(height:10.0),
            Text("SEE ALL AVAILABILITY", style: TextStyle(color: Colors.grey))
          ]),
        ),
        SizedBox(height: 10.0),

        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Services",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00284B)),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.0),

        Container(
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ExpandableText(
              services,
              trimLines: 2,
              openText: "\nSEE ALL SERVICES",
              closeText: "\nSEE LESS",
            ),
          ]),
        ),
        SizedBox(height: 10.0),

        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Reviews",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00284B)),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.0),

        Container(
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ExpandableText(
              text,
              trimLines: 2,
            ),
          ]),
        ),
        SizedBox(height: 10.0),

        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Stats",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00284B)),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.0),

        Container(
          //height: 120,
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child:Container(
                    //margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("385", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                      ],
                    )
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:Container(
                    //margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("10", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                      ],
                    )
                  ),
                ),
                //SizedBox(height: 10.0),
                Expanded(
                  flex: 1,
                  child:Container(
                    //margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("16", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                      ],
                    )
                  ),
                ),
              ],
            ),
        ),
        SizedBox(height: 10.0),

        Container(
          //height: 120,
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child:Container(
                    //margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Patients", textAlign: TextAlign.center,style: TextStyle(fontSize:10.0),),
                      ],
                    )
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:Container(
                    //margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Years of\n Experience", textAlign: TextAlign.center, style: TextStyle(fontSize:10.0),),
                      ],
                    )
                  ),
                ),
                //SizedBox(height: 10.0),
                Expanded(
                  flex: 1,
                  child:Container(
                    //margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Cerificates", textAlign: TextAlign.center,style: TextStyle(fontSize:10.0),),
                      ],
                    )
                  ),
                ),
              ],
            ),
        ),
        SizedBox(height: 10.0),
        
      ]
      ),
    );
  }

}