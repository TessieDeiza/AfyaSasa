import 'package:afyasasa/payment/card.dart';
import 'package:afyasasa/payment/mpesa.dart';
import 'package:flutter/material.dart';

ThemeData userTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.black,
    primaryColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 12.0,
      ),
    ),
  );
}

class MyPayments extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPaymentsPage(title: 'Verify Account'),
    );
  }
  
}

class MyPaymentsPage extends StatefulWidget {
  MyPaymentsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPaymentsPage createState() => _MyPaymentsPage();

}

class _MyPaymentsPage extends State<MyPaymentsPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', color: Color(0xFF00284B));
  final cardColor = Color(0xFF003B5B);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                        Text("My Wallet ",
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
          Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Image.asset('assets/images/QR.png'),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(28.0, 8.0, 28.0, 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Latest Transactions",
                  style: TextStyle(color: Colors.black),
                ),
              ]
            ),
          ),


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
                  Text("Online Transaction:"),
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
              
              ],
              
          ),
          ),
          
          Padding(
            padding: EdgeInsets.fromLTRB(28.0, 8.0, 28.0, 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Preffered Payment Method",
                  style: TextStyle(color: Colors.black),
                ),
              ]
            ),
          ),

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
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text("MPESA", textAlign: TextAlign.center,),
                    )
                    ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("M-pesa"),
                        Text("+254720***034")
                      ],
                    )),
                  Expanded(
                    flex: 1,
                    child: Radio(value: null, groupValue: null, onChanged: null)),
                  Expanded(
                    flex: 1,
                    child: IconButton(icon: Icon(Icons.arrow_forward_ios), 
                    onPressed: () => {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyMpesa(),))
                    })
                  ),
                ],
              ),
              SizedBox(height:5.0),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text("VISA", textAlign: TextAlign.center,),
                    )
                    ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Visa"),
                        Text("6765 7899 **** 9892")
                      ],
                    )),
                  Expanded(
                    flex: 1,
                    child: Radio(value: null, groupValue: null, onChanged: null)),
                  Expanded(
                    flex: 1,
                    child: IconButton(icon: Icon(Icons.arrow_forward_ios), 
                    onPressed: () => {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyCard(),))
                    })
                  ),
                ],
              ),
              
              
              ],
              
          ),
          ),
    

        ],
        
      ),

    );

  }
  
}