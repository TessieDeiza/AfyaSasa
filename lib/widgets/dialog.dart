import 'package:afyasasa/reviews/review.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

    class CustomDialog extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
        );
    }

    Widget dialogContent(BuildContext context) {
        return Container(
        margin: EdgeInsets.only(left: 0.0,right: 0.0),
        child: Stack(
            children: <Widget>[
            Container(
                padding: EdgeInsets.only(
                top: 18.0,
                ),
                margin: EdgeInsets.only(top: 13.0,right: 8.0),
                decoration: BoxDecoration(
                    color: Color(0xFF00284B),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 0.0,
                        offset: Offset(0.0, 0.0),
                    ),
                    ]),
                child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    SizedBox(
                    height: 20.0,
                    ),
                    Center(
                        child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text("Confirmation successful!", style:TextStyle(fontSize: 20.0,color: Colors.white)),
                        )//
                    ),
                    SizedBox(height: 24.0),
                    InkWell(
                    child: Container(
                        padding: EdgeInsets.only(top: 15.0,bottom:15.0),
                        decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "View Appointments",
                              style: TextStyle(color: Color(0xFF00284B),fontSize: 18.0),
                              textAlign: TextAlign.center,
                              ),
                            RichText(
                            text: TextSpan(
                                text: 'Review',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyReview()));
                                },
                              ),
                            ),
                          ],
                        ) 
                    ),
                    onTap:(){
                        Navigator.pop(context);
                    },
                    )
                ],
                ),
            ),
            Positioned(
                right: 0.0,
                child: GestureDetector(
                onTap: (){
                    Navigator.of(context).pop();
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close, color: Color(0xFF00284B)),
                    ),
                ),
                ),
            ),
            ],
        ),
        );
    }
    }