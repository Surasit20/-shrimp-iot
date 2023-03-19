import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/screen/alert.dart';
import 'package:flutter_app2/screen/home.dart';
import 'package:flutter_app2/screen/setting.dart';
import 'package:flutter_app2/screen/welcome.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DatabaseReference _shrimpRef = FirebaseDatabase(
          databaseURL:
              "https://mylogin-cb3ce-default-rtdb.asia-southeast1.firebasedatabase.app/")
      .ref()
      .child('shrimp');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("หน้าโปรไฟล์"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //margin:  EdgeInsets.fromLTRB(20, 0, 0, 20),
              child: Text(
                "ข้อมูลกุ้งเครฟิชที่เลี้ยงในระบบ",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 2, 63),
              width: 116,
              height: 116,
              child: Image.asset(
                "assets/images/crayfishProfile.png",
                fit: BoxFit.cover,
              ),
            ),
            StreamBuilder(
                stream: _shrimpRef.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.hasData && !snapshot.hasError) {
                    Map<String, dynamic> data =
                        jsonDecode(jsonEncode(snapshot!.data!.snapshot!.value));

                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 2, 20),
                          child: Text(
                            "สายพันธ์ :  ${data["species"]}",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 1.2125,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text(
                            "กลุ่มสายพันธ์ :  ${data["species_group"]}",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 1.2125,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 51),
                          child: Text(
                            "ขนาดตัวกุ้ง :  ${data["size"]}  นิ้ว",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 1.2125,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(30, 0, 32.5, 49),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(30, 0, 0, 30),
                                child: Text(
                                  "ข้อมูลเบื้องต้นสำหรับการเลี้ยงกุ้งเครฟิช",
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125,
                                    decoration: TextDecoration.underline,
                                    color: Color(0xffa9a9a9),
                                    decorationColor: Color(0xffa9a9a9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
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
                icon: Image.asset("assets/images/user1.png"),
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
                icon: Image.asset("assets/images/settings.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
