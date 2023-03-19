import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/screen/alert.dart';
import 'package:flutter_app2/screen/home.dart';
import 'package:flutter_app2/screen/profile.dart';
import 'package:flutter_app2/screen/welcome.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final auth = FirebaseAuth.instance;
  DatabaseReference _setNotification = FirebaseDatabase(
          databaseURL:
              "https://mylogin-cb3ce-default-rtdb.asia-southeast1.firebasedatabase.app/")
      .ref()
      .child('set_notification');

  String? _selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("ตั้งค่า"),
      ),*/

      body: Container(
          padding: EdgeInsets.fromLTRB(26, 30, 27, 29),
          width: double.infinity,
          child: StreamBuilder(
              stream: _setNotification.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.hasData && !snapshot.hasError) {
                  Map<String, dynamic> data =
                      jsonDecode(jsonEncode(snapshot!.data!.snapshot!.value));

                  return Column(
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
                                child: Switch(
                                  // This bool value toggles the switch.
                                  value: data["isNotification"],
                                  activeColor: Colors.red,
                                  onChanged: (bool value) {
                                    // This is called when the user toggles the switch.
                                    final postData = {
                                      // key: value,
                                    };
                                    _setNotification
                                        .update({"isNotification": value});
                                    setState(() {
                                      // light = value;
                                    });
                                  },
                                )),
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
                        child: GestureDetector(
                          onTap: () {
                            _show();
                          },
                          child: Text(
                            "${data["time_notification"]} น.",
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: Color(0xffa9a9a9)),
                          ),
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
              })),
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

  Future<void> _show() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "ยกเลิก",
        confirmText: "ตกลง",
        helpText: "เลือกเวลาแจ้งเตือน",
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child ?? Container(),
          );
        });
    print(_selectedTime);
    if (result != null) {
      final time = "${result.hour}:${result.minute}";
      _setNotification.update({"time_notification": time});
    }
  }
}
