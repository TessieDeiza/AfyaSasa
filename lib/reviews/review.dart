
import 'package:afyasasa/appointment/appointment.dart';
import 'package:flutter/material.dart';
import 'package:afyasasa/widgets/dialog.dart';

class MyReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyReviewScreen()
    );
  }
}

class MyReviewScreen extends StatefulWidget {
  MyReviewScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyReviewScreenState createState() => _MyReviewScreenState();

}

class _MyReviewScreenState extends State<MyReviewScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
   Widget build(BuildContext context){

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Review Medic",
        style: TextStyle(color: Colors.black),),
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,
        onPressed: () => {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyAppointment())),
        },
        ),
      ),
      body: ListView(
      children: <Widget>[

        SizedBox(height: 10.0),

        Container(
          margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
            child: Column(
              children: <Widget>[
                
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Image.asset("assets/svg/topdoc.png"),
                ),
                
                SizedBox(height: 20.0),
                Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("How was your experince with doctor Dr. Ruth Ndanu?", style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold, fontSize: 18.0),textAlign: TextAlign.center,),
                      ],
                    )
                  ),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Your Feedback Matters", style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w100, fontSize: 18.0) ),
                    ],
                  )
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star_half),
                      Icon(Icons.star_border)
                    ],
                  )
                ),
                SizedBox(height: 10.0),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Great", style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w100, fontSize: 12.0) ),
                    ],
                  )
                ),
              ],
            ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Write a comment",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00284B)),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.0),

        Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: 
          new InkWell(
          onTap: () {},
          child: new Theme(
            data: new ThemeData(
              primaryColor: Colors.black,
              inputDecorationTheme: InputDecorationTheme(
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              child: TextField(
                maxLines: 8,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(19.0),
                        borderSide: BorderSide(color: Colors.black, width: 3),
                    )),
                ),
            )
          )
        ),

        SizedBox(height: 20.0),

        Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child:Column(
            //mainAxisAlignment: MainAxisAlignment.,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DecoratedBox(
                decoration:
                    ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)), color: Color(0xFF00284B),),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      buttonTheme: ButtonTheme.of(context).copyWith(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
                  child: OutlineButton(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 22.0,), ),
                    onPressed: () => {
                      showDialog(context: context, builder: (BuildContext context) => CustomDialog())
                    },
                  ),
                ),
              ),
            ],
          )
        )
      ]
      ),
    );
  }

}