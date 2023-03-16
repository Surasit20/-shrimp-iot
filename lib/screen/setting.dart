import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/screen/alert.dart';
import 'package:flutter_app2/screen/home.dart';
import 'package:flutter_app2/screen/profile.dart';
import 'package:flutter_app2/screen/welcome.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("ตั้งค่า"),
      ),*/

      body: Container(
        padding: EdgeInsets.fromLTRB(26, 30, 27, 29),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 190, 43),
              child: Text(
                "ตั้งค่า",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 1.2125,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(28, 0, 33, 19),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 78, 0),
                    child: Text(
                      "การแจ้งเตือน",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 1.2125,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    width: 38,
                    height: 20,
                    child: Image.asset(
                      "assets/images/crayfishProfile.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(28, 0, 42, 11),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 33, 0),
                    child: Text(
                      "ตั้งเวลาแจ้งเตือน",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      "assets/images/clock.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(45, 0, 62, 28),
              padding: EdgeInsets.fromLTRB(15, 6, 15, 4),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xccf5f5f5)),
                color: Color(0xccffffff),
              ),
              child: Text(
                "08.00 น.",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.2125,
                    color: Color(0xffa9a9a9)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(28, 0, 40, 68),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 144.89, 0),
                    child: Text(
                      "รหัสผ่าน",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  /* Container(
                    margin: EdgeInsets.fromLTRB(71, 0, 85, 200),
                    width: double.infinity,
                    height: 41,
                    decoration: BoxDecoration(
                      color: Color(0xff000000),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: ElevatedButton(
                        child: Text(
                          auth.currentUser!.email!,
                          style: GoogleFonts.inter(fontSize: 18),
                        ),
                        onPressed: () {
                          auth.signOut().then((value) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                          });
                        },
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
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
                icon: Image.asset("assets/images/home.png"),
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
                icon: Image.asset("assets/images/bell.png"),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, PageRouteBuilder(pageBuilder:
                      (BuildContext context, animation, secondaryAnimation) {
                    return SettingScreen();
                  }));
                },
                icon: Image.asset("assets/images/settings1.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}