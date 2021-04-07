
import 'package:afyasasa/appointment/appointment.dart';
import 'package:afyasasa/home.dart';
import 'package:flutter/material.dart';

class MyMedics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyMedicsScreen()
    );
  }
}

class MyMedicsScreen extends StatefulWidget {
  MyMedicsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMedicsScreenState createState() => _MyMedicsScreenState();

}

class _MyMedicsScreenState extends State<MyMedicsScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
   Widget build(BuildContext context){

     final searchField = Container(
        padding: EdgeInsets.all(16.0),
        child: 
          new InkWell(
          onTap: () {},
          child: new Theme(
            data: new ThemeData(
              hintColor: Colors.black,
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
                  style: style,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Search",
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(19.0),
                          borderSide: BorderSide(color: Colors.black, width: 3),
                      )),
                ),
            )
          )
        );
    

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("List of Medics",
        style: TextStyle(color: Colors.black),),
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,
        onPressed: () => {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => MyHomeScreen())),
        },
        ),
      ),
      body: ListView(
      children: <Widget>[
        searchField,

        Container(
          height: 120,
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
          child: Card(
            elevation: 5,
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
                //Spacer(),
                Expanded(
                  flex: 3,
                  child:Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Dr Ruth Ndanu", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("General Practitioner"),
                        Text( "(0 Reviews)"),
                        DecoratedBox(
                          decoration:
                              ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)), color: Color(0xFF000000),),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                buttonTheme: ButtonTheme.of(context).copyWith(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
                            child: OutlineButton(
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                              child: Text('Make Appointment', style: TextStyle(color: Colors.white),),
                              onPressed: () => {
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyAppointment() ))
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                //Spacer(),
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
        ),

        Container(
          height: 120,
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
          child: Card(
            elevation: 5,
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
                //Spacer(),
                Expanded(
                  flex: 3,
                  child:Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Dr Ruth Ndanu", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("General Practitioner"),
                        Text( "(0 Reviews)"),
                        DecoratedBox(
                          decoration:
                              ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)), color: Color(0xFF000000),),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                buttonTheme: ButtonTheme.of(context).copyWith(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
                            child: OutlineButton(
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                              child: Text('Make Appointment', style: TextStyle(color: Colors.white),),
                              onPressed: () => {
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyAppointment() ))
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                //Spacer(),
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
        ),

        Container(
          height: 120,
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
          child: Card(
            elevation: 5,
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
                //Spacer(),
                Expanded(
                  flex: 3,
                  child:Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Dr Ruth Ndanu", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("General Practitioner"),
                        Text( "(0 Reviews)"),
                        DecoratedBox(
                          decoration:
                              ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)), color: Color(0xFF000000),),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                buttonTheme: ButtonTheme.of(context).copyWith(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
                            child: OutlineButton(
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                              child: Text('Make Appointment', style: TextStyle(color: Colors.white),),
                              onPressed: () => {
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyAppointment() ))
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                //Spacer(),
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
        ),
      
        Container(
          height: 120,
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
          child: Card(
            elevation: 5,
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
                //Spacer(),
                Expanded(
                  flex: 3,
                  child:Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Dr Ruth Ndanu", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("General Practitioner"),
                        Text( "(0 Reviews)"),
                        DecoratedBox(
                          decoration:
                              ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)), color: Color(0xFF000000),),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                buttonTheme: ButtonTheme.of(context).copyWith(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
                            child: OutlineButton(
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                              child: Text('Make Appointment', style: TextStyle(color: Colors.white),),
                              onPressed: () => {
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyAppointment() ))
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                //Spacer(),
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
        ),
      
      ]
      ),
    );
  }

}