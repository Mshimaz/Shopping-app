import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/home/CartScreen.dart';
import 'package:shopping_app/screens/home/FavoriteScreen.dart';
import 'package:shopping_app/screens/home/drawerScreen.dart';
import 'package:shopping_app/widgets/ShoppingNavigationBar.dart';
import 'package:shopping_app/screens/home/HomeScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentindex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final tabs = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    Center(child: Text("Profile")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xffFBFBFD),
      appBar: AppBar(
        leading: InkWell(
          child: Container(
              margin: EdgeInsets.only(
                left: 10,
              ),
              width: 42,
              height: 36,
              child: Image.asset(("assets/logo/Group 23.png"))),
          onTap: () {
            scaffoldKey.currentState.openDrawer();
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "\t\t\t\t\t\t\tShopping App",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      drawer: DrawerScreen(),
      body: tabs[_currentindex],
      bottomNavigationBar: ShoppingNavigationBar(
        currentindex: _currentindex,
        ontap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
