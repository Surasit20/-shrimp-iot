import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app2/screen/profile.dart';
import 'package:flutter_app2/screen/setting.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/sensor.dart';
import '../widget/bottom_bar.dart';
import 'alert.dart';
import 'package:firebase_database/firebase_database.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //const WelcomeScreen({Key? key}) : super(key: key);
  final auth = FirebaseAuth.instance;

  DatabaseReference _readSensorRef = FirebaseDatabase(
          databaseURL:
              "https://mylogin-cb3ce-default-rtdb.asia-southeast1.firebasedatabase.app/")
      .ref()
      .child('read_sensor');

  DatabaseReference _setSensorRef = FirebaseDatabase(
          databaseURL:
              "https://mylogin-cb3ce-default-rtdb.asia-southeast1.firebasedatabase.app/")
      .ref()
      .child('set_sensor');

  final iconMonitor = {
    "อุณหภูมิ": "assets/icons/Temp.png",
    "ค่า pH": "assets/icons/ph.png",
    "ค่าความขุ่น": "assets/icons/water.png",
    "เวลาให้อาหารล่าสุด": "assets/icons/clock (1).png",
  };

  int? _setTemperature;
  int _countTemperature = 0;
  final _readTemperature = BehaviorSubject<int>();
  BottomBar _bottomBar = BottomBar();
  @override
  void initState() {
    // TODO: implement initState
    /*
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        debugPrint("onMessage:");
        log("onMessage: $message");
        final snackBar =
            SnackBar(content: Text(message.notification?.title ?? ""));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );

    */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(
        //  title: Text("หน้าแรก"),
        //),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "ตรวจสอบและควมคุมระบบ",
              style: TextStyle(
                fontSize: 20,
                //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                color: Colors.black, //font color
                //background color
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 2,
              child: StreamBuilder(
                  stream: _readSensorRef.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData && !snapshot.hasError) {
                      Map<String, dynamic> data = jsonDecode(
                          jsonEncode(snapshot!.data!.snapshot!.value));

                      return GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          padding: EdgeInsets.all(20),
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(40.0)),
                                        color: Colors.white,
                                      ),
                                      height: 400,
                                      child: StreamBuilder(
                                          stream: _setSensorRef.onValue,
                                          builder: (context,
                                              AsyncSnapshot<DatabaseEvent>
                                                  snapshot) {
                                            if (snapshot.hasData &&
                                                !snapshot.hasError) {
                                              Map<String, dynamic> data =
                                                  jsonDecode(jsonEncode(
                                                      snapshot!.data!.snapshot!
                                                          .value));

                                              return _changeTemperature(
                                                  data["temperature"]);
                                            } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          }),
                                    );
                                  },
                                );
                              },
                              child: _monitorLayout(
                                  "อุณหภูมิ", data["temperature"]),
                            ),
                            _monitorLayout("ค่า pH", data["ph"]),
                            _monitorLayout("ค่าความขุ่น", data["nut"]),
                            GestureDetector(
                                onTap: () {
                                  _show();
                                  return;
                                  showModalBottomSheet<void>(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(40.0)),
                                          color: Colors.white,
                                        ),
                                        height: 400,
                                        child: StreamBuilder(
                                            stream: _setSensorRef.onValue,
                                            builder: (context,
                                                AsyncSnapshot<DatabaseEvent>
                                                    snapshot) {
                                              if (snapshot.hasData &&
                                                  !snapshot.hasError) {
                                                Map<String, dynamic> data =
                                                    jsonDecode(jsonEncode(
                                                        snapshot!.data!
                                                            .snapshot!.value));

                                                return Container();
                                              } else {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                            }),
                                      );
                                    },
                                  );
                                },
                                child: _monitorLayout(
                                    "เวลาให้อาหารล่าสุด", data["time_feeder"])),
                          ]);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: _setSensorRef.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData && !snapshot.hasError) {
                      Map<String, dynamic> data = jsonDecode(
                          jsonEncode(snapshot!.data!.snapshot!.value));

                      _readTemperature.add(data["temperature"]);
                      return GridView.count(
                          childAspectRatio: (1 / .3),
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          children: [
                            _switchLayout("ปั้มน้ำเข้า", data["water_pump_in"],
                                "water_pump_in"),
                            _switchLayout("ปั้มน้ำออก", data["water_pump_out"],
                                "water_pump_out"),
                            _switchLayout("ฮีทเตอร์", data["heater"], "heater"),
                            _switchLayout("ออกซิเจน", data["o2"], "o2"),
                            _switchLayout("Feeder", data["feeder"], "feeder"),
                            _switchLayout("LED", data["led"], "led")
                          ]);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        )),
        bottomNavigationBar: _bottomBar.bottonBar(context));
  }

  Widget _monitorLayout(String type, dynamic value) {
    return Container(
      width: 50,
      height: 70,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: [
        Image.asset(
          iconMonitor[type].toString(),
          width: 70,
          height: 70,
        ),
        Text(type.toString()),
        Text(value.toString())
      ]),
    );
  }

  Widget _switchLayout(String type, dynamic valueCurr, String key) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 50,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20.0),
        /*
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
        */
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(type.toString()),
        Switch(
          // This bool value toggles the switch.
          value: valueCurr,
          activeColor: Colors.green,
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            final postData = {
              key: value,
            };
            _setSensorRef.update({key: value});
            setState(() {
              // light = value;
            });
          },
        )
      ]),
    );
  }

  Widget _changeTemperature(dynamic temperature) {
    return Container(
      width: 50,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Column(children: [
              Text(
                "อุณหภูมิ",
                style: TextStyle(
                  fontSize: 18,
                  //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                  color: Colors.black, //font color
                  //background color
                ),
              ),
              IconButton(
                  onPressed: () {
                    _setSensorRef.update({"temperature": temperature + 1});
                    _countTemperature += 1;
                  },
                  icon: Icon(Icons.arrow_drop_up)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(temperature.toString()), Text("C")],
              ),
              IconButton(
                  onPressed: () {
                    _setSensorRef.update({"temperature": temperature - 1});
                    _countTemperature -= 1;
                  },
                  icon: Icon(Icons.arrow_drop_down)),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 120,
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))),
                        onPressed: () {
                          print(_countTemperature.toString());
                          _setSensorRef.update(
                              {"temperature": temperature - _countTemperature});
                          _countTemperature = 0;
                          Navigator.pop(context);
                        },
                        child: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            fontSize: 18,
                            //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                            color: Colors.black, //font color
                            //background color
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))),
                        onPressed: () {
                          print('Button pressed');
                          _countTemperature = 0;
                          Navigator.pop(context);
                        },
                        child: Text(
                          'ยืนยัน',
                          style: TextStyle(
                            fontSize: 18,
                            //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                            color: Colors.white, //font color
                            //background color
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    minimumSize: Size(88, 44),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    backgroundColor: Colors.blue,
  );
  void test(int temperature) {
    setState(() {
      _setTemperature = temperature;
    });
  }

  Future<void> _show() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "ยกเลิก",
        confirmText: "ตกลง",
        helpText: "เลือกเวลาให้อาหาร",
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child ?? Container(),
          );
        });
    // print(_selectedTime);
    if (result != null) {
      _setSensorRef.update({"time_feeder": (result.hour * 60) + result.minute});
      final time = "${result.hour}:${result.minute}";
      // _setNotification.update({"time_notification": time});
    }
  }
}
