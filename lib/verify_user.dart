
import 'dart:async';
import 'dart:io';
import 'package:afyasasa/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class MyVerifyUserPage extends StatefulWidget {
  final String verificationId;
  final String phoneNo;
  MyVerifyUserPage({Key key, this.verificationId, this.phoneNo, this.callback}): super(key: key);
  final Function callback;

  @override
  _MyVerifyUserPageState createState() => new _MyVerifyUserPageState();
}

class _MyVerifyUserPageState extends State<MyVerifyUserPage> with TickerProviderStateMixin{
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final db = Firestore.instance;
  String errorMessage = '';
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isPressed = false, _animatingReveal = false;
  int _state = 0;
  double _width = double.infinity;
  Animation _animation;
  GlobalKey _verifyBtnKey = GlobalKey();
  AnimationController _controller;
  
  addBoolToSF() async {
    

  }


  bool validateAndSend(){
    final form = formKey.currentState;
    if (form.validate()){
      return true;
    }else{
      return false;
    }
  }

  @override
  void deactivate() {
    reset();
    super.deactivate();
  }

  @override
  dispose() {
    _controller?.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    bool _saving = false;

    

    void _showDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Uh Oh!"),
            content: new Text("Your verification code does not seem right. Try again?"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Try again"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    // _verify () async{
    //   setState(() {
    //     _saving = true;
    //   });
    //   AuthCredential _credential;

    //   String smsCode = _codeController.text.trim();
    //   _credential = PhoneAuthProvider.getCredential(verificationId: widget.verificationId, smsCode: smsCode);
    //   _auth.signInWithCredential(_credential).then((AuthResult result) {
    //     print(result);

    //     Navigator.pushReplacement(context, MaterialPageRoute(
    //       builder: (context) => NavBar(user: result.user)
    //     ));
    //   }).catchError((e){
    //     print(e);
    //     _showDialog();
    //   });
    // }

  _verify() async {
    print("error after this");
    try {
      setState(() {
        _saving = true;
      });

      String smsCode = _codeController.text.trim();
      final AuthCredential _credential = PhoneAuthProvider.getCredential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );
      final FirebaseUser user = (await _auth.signInWithCredential(_credential)).user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      //Navigator.of(context).pop();
      DocumentReference mobileRef = db
          .collection("mobile_nos")
          .document(widget.phoneNo.replaceAll(new RegExp(r'[^\w\s]+'), ''));
      await mobileRef.get().then((documentReference) {
        if (!documentReference.exists) {
          mobileRef.setData({}).then((documentReference) async {
            await db.collection("users").add({
              'uid': "",
              'name': "No Name",
              'mobile': widget.phoneNo.replaceAll(new RegExp(r'[^\w\s]+'), ''),
              'profile_photo': "",
            }).then((documentReference) {
              prefs.setBool('is_verified', true);
              prefs.setString(
                'mobile',
                widget.phoneNo.replaceAll(new RegExp(r'[^\w\s]+'), ''),
              );
              print("Printing uid...");
              print(documentReference.documentID);
              prefs.setString('uid', documentReference.documentID);
              prefs.setString('name', "No Name");
              prefs.setString('profile_photo', "");

              mobileRef.setData({'uid': documentReference.documentID}).then(
                  (documentReference) async {
                print("going into navigator");
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => NavBar(prefs: prefs, user: user)));
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => NavBar(prefs: prefs, user: user)
                ));
              }).catchError((e) {
                print(e);
              });
            }).catchError((e) {
              print(e);
            });
          });
        } else {
          print("doc ref exixts...");
          print(documentReference.documentID);
          prefs.setBool('is_verified', true);
          prefs.setString(
            'mobile_number',
            widget.phoneNo.replaceAll(new RegExp(r'[^\w\s]+'), ''),
          );
          prefs.setString('uid', documentReference["uid"]);
          prefs.setString('name', documentReference["name"]);
          prefs
              .setString('profile_photo', documentReference["profile_photo"]);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => NavBar(prefs: prefs, user: user),
            ),
          );
        }
      }).catchError((e) {});
    } catch (e) {
      print(e);
      _showDialog();
    }
  }


    final codeField = new InkWell(
          onTap: () {},
          child: new Theme(
            data: new ThemeData(
              hintColor: Colors.black,
              primaryColor: Colors.black,
            ),
            child: new TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
                new LengthLimitingTextInputFormatter(6)
              ],
              textAlign: TextAlign.center,
              style: style,
              decoration: new InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(19.0)
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: '__ __ __ __ __ __',
                labelText: 'Verification Code',
                ),
              validator: (value){
                if(value.isEmpty)return "Verification cannot be empty";
                else if (value.length != 6)return "Check your verification code";
                else return null;
              },
              controller: _codeController,
            )
          )
        );
  
    final verifyButton = Material(
      elevation: calculateElevation(),
      borderRadius: BorderRadius.circular(19.0),
      color: Color(0xFF000000),
      child: Container(
        key: _verifyBtnKey,
        height: 48.0,
        width: _width,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
          ),
          padding: EdgeInsets.all(0.0),
          color: _state == 2 ? Color(0xFF003B5B) : Color(0xFF003B5B),
          child: buildButtonChild(),
          onPressed: () {
            _auth.currentUser().then((user) async {
              _verify();
            });
          },
          onHighlightChanged: (isPressed) {
            if (validateAndSend()){
              setState(() {
                _isPressed = isPressed;
                if (_state == 0) {
                  animateButton();
                }
              });
            }
          },
        ),
      ),
    );

    return Scaffold(
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(),
        opacity: 0.5,
        color: Colors.blueGrey[300],
        inAsyncCall: _saving,
        child: Center(
          child: Form(
          key: formKey,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 35.0),
                  codeField,
                  SizedBox(
                    height: 35.0,
                  ),
                  verifyButton,
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }

  void animateButton() {
    double initialWidth = _verifyBtnKey.currentContext.size.width;

    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          //_width = initialWidth - ((initialWidth - 48.0) * _animation.value);
          _width = initialWidth;
        });
      });
    _controller.forward();

    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });

    Timer(Duration(milliseconds: 3600), () {
      _animatingReveal = true;
      widget.callback();
    });
  }

  Widget buildButtonChild() {
    if (_state == 0) {
      return Text(
        'Verify',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );
    } else if (_state == 1) {
      return SizedBox(
        height: 36.0,
        width: 36.0,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        'Verify',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );
    }
  }

  double calculateElevation() {
    if (_animatingReveal) {
      return 0.0;
    } else {
      return _isPressed ? 6.0 : 4.0;
    }
  }

  void reset() {
    _width = double.infinity;
    _animatingReveal = false;
    _state = 0;
  }

}

