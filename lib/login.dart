import 'package:afyasasa/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class MyLoginScreen extends StatefulWidget{
  MyLoginScreen({this.auth, this.signedIn, this.callback});
  final BaseAuth auth;
  final signedIn;
  final Function callback;

  @override
  State<StatefulWidget> createState() => new _LoginScreenState();

}

class _LoginScreenState extends State<MyLoginScreen> with TickerProviderStateMixin{
  TextStyle style = TextStyle(fontFamily: 'SF Pro', fontSize: 20.0);
  final formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  bool _isPressed = false, _animatingReveal = false;
  int _state = 0;
  double _width = double.infinity;
  Animation _animation;
  GlobalKey _loginBtnKey = GlobalKey();
  AnimationController _controller;
  

  bool validateAndSend(){
    final form = formKey.currentState;
    if (form.validate()){
      return true;
    }else{
      return false;
    }

  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Uh Oh!"),
          content: new Text("You have caught us with out pants down. Something seems to be broken, we will fix it"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Help"),
              onPressed: () {
                //Navigator.of(context).pop();
              },
            ),
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

  void requestOTP(){
    if (validateAndSend()){
      try {
        print("requesting ...");
        widget.auth.registerUser("+254" + _phoneController.text, context);
      }
      catch (e){
        print(e);
        _showDialog();
      }
      
    }
  }

  @override
  void deactivate() {
    reset();
    super.deactivate();
  }

  // @override
  // dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final phoneField = new TextFormField(
      key: Key("phoneField"),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly,
      new LengthLimitingTextInputFormatter(9)],
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        prefixText: '+ 254 ',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: 'Enter your mobile number',
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(19.0))
      ),
      //validator: (value) => value.isEmpty? "Mobile number cannot be empty" : null,
      validator: (value){
        if(value.isEmpty)return "Mobile number cannot be empty";
        else if (value.length != 9)return "Check your mobile number";
        else return null;
      },
      controller: _phoneController,
    );
   
    final loginButon = Material(
      elevation: calculateElevation(),
      borderRadius: BorderRadius.circular(19.0),
      color: Color(0xFF000000),
      child: Container(
        key: _loginBtnKey,
        height: 48.0,
        width: _width,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
          ),
          padding: EdgeInsets.all(0.0),
          color: _state == 2 ? Colors.green : Color(0xFF003B5B),
          child: buildButtonChild(),
          onPressed: () {
            requestOTP();
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
      body: Center(
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
                  SizedBox(
                    height: 100.0,
                    child: Image.asset(
                      "assets/images/splash.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 35.0),
                  phoneField,
                  SizedBox(
                    height: 35.0,
                  ),
                  loginButon,
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }

  void animateButton() {
    double initialWidth = _loginBtnKey.currentContext.size.width;

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
        'Login',
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
      return Icon(Icons.check, color: Colors.white);
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
