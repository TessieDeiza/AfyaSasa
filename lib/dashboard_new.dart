import 'package:afyasasa/activityfiles/charts.dart';
import 'package:afyasasa/auth.dart';
//import 'package:afyasasa/widgets/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:afyasasa/widgets/bottom_app_bar/fab_bottom_appbar.dart';
import 'package:afyasasa/widgets/bottom_app_bar/fab_with_icons.dart';
import 'package:afyasasa/widgets/bottom_app_bar/layout.dart';
import 'package:afyasasa/home.dart';
import 'package:afyasasa/search.dart';
import 'package:afyasasa/plugin.dart';
import 'package:afyasasa/activity.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:afyasasa/widgets/nav-drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NavBar extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'BottomAppBar with FAB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          _lastSelected,
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      // bottomNavigationBar: FABBottomAppBarItem(
      //   centerItemText: 'A',
      //   color: Colors.grey, 
      //   selectedColor: Colors.red,
      //   notchedShape: CircularNotchedRectangle(),
      //   onTabSelected: _selectedTab,
      //   items: [
      //     FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
      //     FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
      //     FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
      //     FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
      //   ],
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}