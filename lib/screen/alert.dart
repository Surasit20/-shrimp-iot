import 'package:flutter/material.dart';
import 'package:flutter_app2/screen/profile.dart';
import 'package:flutter_app2/screen/setting.dart';
import 'package:flutter_app2/screen/welcome.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("การแจ้งเตือน"),
      ),*/
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 30, 0, 29),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 157, 19),
              child: Text(
                "การแจ้งเตือน",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 1.2125,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(13, 0, 0, 13),
              width: 315,
              height: 120,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Align(
                      child: SizedBox(
                        width: 282,
                        height: 120,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff000000)),
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 18,
                    top: 12,
                    child: Align(
                      child: SizedBox(
                        width: 282,
                        height: 19,
                        child: Text("วันที่  xx/xx/xxxx   เวลา xx:xx น.",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Colors.black,
                        ),
                       ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 45,
                    child: Align(
                      child: SizedBox(
                        width: 160,
                        height: 19,
                        child: Text("อุณหภูมิ :   xx °C ",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Colors.black,
                        ),
                       ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 68,
                    child: Align(
                      child: SizedBox(
                        width: 103,
                        height: 19,
                        child: Text("ค่า  pH :   x.x",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Colors.black,
                        ),
                       ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 91,
                    child: Align(
                      child: SizedBox(
                        width: 285,
                        height: 19,
                        child: Text("ค่าความขุ่นของน้ำ :   x.x    NTU",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Colors.black,
                        ),
                       ),
                      ),
                    ),
                  ),
                  
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
                icon: Image.asset("assets/images/bell1.png"),
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
      ),
    );
  }
}
