import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/screen/profile.dart';
import 'package:flutter_app2/screen/setting.dart';
import 'package:flutter_app2/screen/welcome.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/bottom_bar.dart';

class AlertScreen extends StatefulWidget {
  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  BottomBar _bottomBar = BottomBar();
  DatabaseReference _readNotification = FirebaseDatabase(
          databaseURL:
              "https://mylogin-cb3ce-default-rtdb.asia-southeast1.firebasedatabase.app/")
      .ref()
      .child('notification');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("การแจ้งเตือน"),
      ),*/
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
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
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: FirebaseAnimatedList(
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    query: _readNotification,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return Container(
                        height: 120,
                        width: 150,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "วันที่ ${snapshot.child("date").value.toString()}"),
                                  Text(
                                      "เวลา ${snapshot.child("time").value.toString()}"),
                                ],
                              ),
                              Text(
                                  "อุณหภูมิ: ${snapshot.child("temprature").value.toString()}"),
                              Text(
                                  "ค่า pH: ${snapshot.child("ph").value.toString()}"),
                              Text(
                                  "ค่าความสะอาดของน้ำ: ${snapshot.child("nut").value.toString()}"),
                            ]),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
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
