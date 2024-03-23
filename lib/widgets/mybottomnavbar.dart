import 'package:flutter/material.dart';
import 'package:wellancer/screens/home.dart';
import 'package:wellancer/screens/profile.dart';
import 'mybottomnavitem.dart';

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  Widget goToHome(BuildContext context) {
    return HomeScreen();
  }

  Widget goToAccount(BuildContext context) {
    return AccountScreen();
  }

  void goToJobDetails(BuildContext context, int jobId) {
    Navigator.pushNamed(context, '/jobdetail', arguments: jobId);
  }

  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          MyBottomNavItem(
            text: "Home",
            icon: Icons.home,
            id: 0,
            onPressed: () {
              setState(() {
                _active = 0;
              });
              Navigator.push(context, MaterialPageRoute(builder: goToHome));
            },
            active: _active,
          ),
          MyBottomNavItem(
            text: "Job",
            icon: Icons.business_center,
            id: 1,
            onPressed: () {
              setState(() {
                _active = 1;
              });
            },
            active: _active,
          ),
          MyBottomNavItem(
            text: "Profile",
            icon: Icons.account_circle,
            id: 2,
            onPressed: () {
              setState(() {
                _active = 2;
              });
              Navigator.push(context, MaterialPageRoute(builder: goToAccount));
            },
            active: _active,
          ),
          // MyBottomNavItem(
          //   text: "Jobs",
          //   icon: Icons.work,
          //   id: 3,
          //   onPressed: () {
          //     setState(() {
          //       _active = 3;
          //     });
          //   },
          //   active: _active,
          // ),
        ],
      ),
    );
  }
}
