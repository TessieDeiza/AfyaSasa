import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<SearchPage>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final cardColor = Color(0xFF003B5B);

  @override
  Widget build(BuildContext context) {

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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
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
                            Text("Pharamacy",
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
              ),
          ),
      
          body: ListView(
            children: <Widget>[
              SizedBox(height: 10.0),
              searchField,
              SizedBox(height: 5.0),

              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Choose a Category",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.black),
                        ),
                      ]
                    )
                    
                  ]
                ),
              ),

              Container(
                height: 140,
                //padding: new EdgeInsets.all(4.0),
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(children: <Widget>[
                          new Card(
                          //margin: new EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: new 
                              Container(
                                height: 70,
                                margin: new EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: Icon(Icons.local_hospital, size: 50),
                                    ),
                                  ],
                                ),
                              ),
                          ),
                          SizedBox(height: 10.0),
                          new Text('Cough & Cold',
                          //style: TextStyle(fontSize:16.0)
                          ),
                        ],
                        ),     
                      ),
                      Expanded(
                        child: Column(children: <Widget>[
                          new Card(
                          //margin: new EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: new 
                              Container(
                                margin: new EdgeInsets.all(16.0),
                                height: 70,
                                decoration: BoxDecoration(
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: Icon(Icons.local_hospital, size: 50),
                                    ),
                                  ],
                                ),
                              ),
                          ),
                          SizedBox(height: 10.0),
                          new Text('Diabetes Care',
                          //style: TextStyle(fontSize:16.0)
                          ),
                        ],
                        ),     
                      ),
                      Expanded(
                        child: Column(children: <Widget>[
                          new Card(
                          //margin: new EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: new 
                              Container(
                                margin: new EdgeInsets.all(16.0),
                                height: 70,
                                decoration: BoxDecoration(
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: Icon(Icons.local_hospital, size: 50),
                                    ),
                                  ],
                                ),
                              ),
                          ),
                          SizedBox(height: 10.0),
                          new Text('Consultation',
                          //style: TextStyle(fontSize:16.0)
                          ),
                        ],
                        ),     
                      ),
                      ],
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Seach by health concern",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.black),
                    ),
                  ]
                ),
              ),

              Container(
                height: 85,
                padding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child:new Card(
                          
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: new Container(
                              padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: new Column(
                              children: <Widget>[
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Container(
                                      padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        border: Border.all(color: Colors.black, width: 2), 
                                      ),
                                      child: Icon(Icons.local_hospital),
                                    ),
                                    SizedBox(width: 10.0),
                                    new Text('General Doctor',
                                    style: TextStyle(fontWeight: FontWeight.w500 , color: Colors.black)),
                                  ]
                                  ),
                                  ],
                              ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      Expanded(
                        child:new Card(
                          
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: new Container(
                              padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: new Column(
                              children: <Widget>[
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Container(
                                      padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        border: Border.all(color: Colors.black, width: 2), 
                                      ),
                                      child: Icon(Icons.local_hospital),
                                    ),
                                    SizedBox(width: 10.0),
                                    new Text('Dental Care',
                                    style: TextStyle(fontWeight: FontWeight.w500 , color: Colors.black)),
                                  ]
                                  ),
                                  ],
                              ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Online Consultation",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.black),
                    ),
                  ]
                ),
              ),

              Container(
                height: 140,
                //padding: new EdgeInsets.all(4.0),
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(children: <Widget>[
                          new Card(
                          //margin: new EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: new 
                              Container(
                                height: 70,
                                margin: new EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: Icon(Icons.local_hospital, size: 50),
                                    ),
                                  ],
                                ),
                              ),
                          ),
                          SizedBox(height: 10.0),
                          new Text('Well Baby',
                          // style: TextStyle(fontSize:16.0)
                          ),
                        ],
                        ),     
                      ),
                      Expanded(
                        child: Column(children: <Widget>[
                          new Card(
                          //margin: new EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: new 
                              Container(
                                margin: new EdgeInsets.all(16.0),
                                height: 70,
                                decoration: BoxDecoration(
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: Icon(Icons.local_hospital, size: 50),
                                    ),
                                  ],
                                ),
                              ),
                          ),
                          SizedBox(height: 10.0),
                          new Text('PEP',
                          // style: TextStyle(fontSize:16.0)
                          ),
                        ],
                        ),     
                      ),
                      Expanded(
                        child: Column(children: <Widget>[
                          new Card(
                          //margin: new EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: new 
                              Container(
                                margin: new EdgeInsets.all(16.0),
                                height: 70,
                                decoration: BoxDecoration(
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: Icon(Icons.local_hospital, size: 50),
                                    ),
                                  ],
                                ),
                              ),
                          ),
                          SizedBox(height: 10.0),
                          new Text('Sick Off',
                          // style: TextStyle(fontSize:16.0)
                          ),
                        ],
                        ),     
                      ),
                      ],
                  ),
                ),
              ),

            ],
          ),
        );
  }
}
