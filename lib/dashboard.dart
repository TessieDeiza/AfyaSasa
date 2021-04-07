import 'package:afyasasa/activityfiles/charts.dart';
import 'package:afyasasa/auth.dart';
import 'package:afyasasa/widgets/bottom_app_bar/fab_bottom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:afyasasa/home.dart';
import 'package:afyasasa/search.dart';
import 'package:afyasasa/plugin.dart';
import 'package:afyasasa/activity.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:afyasasa/widgets/nav-drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NavBar extends StatefulWidget {
  final FirebaseUser user;
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final SharedPreferences prefs;
  NavBar({Key key, this.user, this.auth, this.onSignedOut, this.prefs}) : super(key: key);


  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<NavBar> {
  // String _lastSelected = 'TAB: 0';
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  int _selectedScreen = 0;
  int currentIndex = 0;
  //static const TextStyle optionStyle = TextStyle(fontSize: 30);
  List<Widget> _widgetOptions() => [
    MyHomeScreen(),
    SearchPage(),
    MyPayments(),
    MyActivity(),
    //MyChartsPage(prefs: widget.prefs),
  ];

  

  Widget pluginIcon =
      SvgPicture.asset('assets/icons/plugin.svg');

  void _onItemTapped(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = _widgetOptions();
    print(widget.prefs);
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(
        auth: widget.auth,
        onSignedOut: widget.onSignedOut,
      ),
      // appBar: AppBar(
      //   //title: const Text('Salutare'),
      //   backgroundColor: Colors.white,
      // ),
      body: Center(
        child: widgetOptions.elementAt(_selectedScreen),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
        child: Icon(Icons.menu),
        backgroundColor: Color(0xFFFC670C),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FABBottomAppBar(
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.local_hospital, text: 'Pharamacy'),
          FABBottomAppBarItem(iconData: Icons.account_balance_wallet, text: 'Payment'),
          FABBottomAppBarItem(iconData: Icons.notifications, text: 'Activity'),
        ],
        onTabSelected: _onItemTapped,
        notchedShape: CircularNotchedRectangle(),
      ),
    );
  }
}
