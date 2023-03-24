import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/alert.dart';
import '../screen/profile.dart';
import '../screen/setting.dart';
import '../screen/welcome.dart';

class BottomBar {
  Widget bottonBar(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Color(0xFFDADADA)..withOpacity(0.15))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder:
                    (BuildContext context, animation, secondaryAnimation) {
                  return WelcomeScreen();
                }));
              },
              icon: Image.asset("assets/images/home1.png"),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder:
                    (BuildContext context, animation, secondaryAnimation) {
                  return ProfileScreen();
                }));
              },
              icon: Image.asset("assets/images/user.png"),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder:
                    (BuildContext context, animation, secondaryAnimation) {
                  return AlertScreen();
                }));
              },
              icon: Image.asset(
                "assets/images/bell.png",
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder:
                    (BuildContext context, animation, secondaryAnimation) {
                  return SettingScreen();
                }));
              },
              icon: Image.asset("assets/images/settings.png"),
            )
          ],
        ),
      ),
    );
  }
}
