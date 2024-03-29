import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
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
    "ให้อาหารทุกๆ": "assets/icons/clock (1).png",
  };

  int? _setTemperature;
  int _countTemperature = 0;
  int _hour = 0, _minute = 0;
  final _readTemperature = BehaviorSubject<int>();
  BottomBar _bottomBar = BottomBar();

  bool _input = false;
  bool _output = false;
  String minPh = "";
  String maxPh = "";
  String minNtu = "";
  String maxNtu = "";
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
              height: 5,
            ),
            Text(
              "ตรวจสอบและควมคุมระบบ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                color: Colors.black, //font color
                //background color
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 3,
              child: StreamBuilder(
                  stream: _readSensorRef.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData && !snapshot.hasError) {
                      Map<String, dynamic> data = jsonDecode(
                          jsonEncode(snapshot!.data!.snapshot!.value));

                      if (data["time_feeder"] > 24 || data["time_feeder"] < 0) {
                        _readSensorRef.update({"time_feeder": 0});
                      }
/*
                      String minuteStr = data["time_feeder"].toString();
                      int n = data["time_feeder"].length;
                      if (minuteStr[n-1] == ""){


                      }
                      */
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

                                              return _changePh(data["set_ph"]);
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
                              child: _monitorLayout("ค่า pH", data["ph"]),
                            ),
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

                                              return _changePh(data["set_ph"]);
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
                              child: _monitorLayout("ค่าความขุ่น", data["nut"]),
                            ),
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
                                            stream: _readSensorRef.onValue,
                                            builder: (context,
                                                AsyncSnapshot<DatabaseEvent>
                                                    snapshot) {
                                              if (snapshot.hasData &&
                                                  !snapshot.hasError) {
                                                Map<String, dynamic> data =
                                                    jsonDecode(jsonEncode(
                                                        snapshot!.data!
                                                            .snapshot!.value));

                                                return _changeTimeFeeder(
                                                    data["time_feeder"]);
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
                                child: _monitorLayout("ให้อาหารทุกๆ",
                                    "${data["time_feeder"].toString()}")),
                          ]);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Expanded(
              flex: 2,
              child: StreamBuilder(
                  stream: _setSensorRef.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData && !snapshot.hasError) {
                      Map<String, dynamic> data = jsonDecode(
                          jsonEncode(snapshot!.data!.snapshot!.value));

                      if (data["water_pump_in"] == true &&
                          data["water_pump_out"] == true) {
                        data["water_pump_in"] = false;
                        data["water_pump_out"] = false;
                        _setSensorRef.update({"water_pump_in": false});
                        _setSensorRef.update({"water_pump_out": false});
                      }

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
                            _switchLayout("LED", data["led"], "led"),
                            _switchLayout(
                                "กรองน้ำ", data["water_filter"], "water_filter")
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

//แสดง monitor
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
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.asset(
          iconMonitor[type].toString(),
          width: 70,
          height: 70,
        ),
        Text(type.toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 20,
                //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                color: Colors.black, //font color
                //background color
              ),
            ),
            Text(
              " ${type == "อุณหภูมิ" ? "°C" : type == "ค่าความขุ่น" ? "NTU" : type == "ให้อาหารทุกๆ" ? "ชั่วโมง" : ""}",
              style: TextStyle(
                fontSize: 20,
                //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                color: Colors.black, //font color
                //background color
              ),
            ),
          ],
        )
      ]),
    );
  }

//ปรับเซนเซอร์
  Widget _switchLayout(String type, dynamic valueCurr, String key) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 50,
      height: 20,
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

  Widget _changeNtu(dynamic ntu) {
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
                "กำหนดค่า NTU",
                style: TextStyle(
                  fontSize: 18,
                  //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                  color: Colors.black, //font color
                  //background color
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => minNtu = value,
                      initialValue: ntu["min_ntu"].toString(),
                      decoration: const InputDecoration(
                        hintText: 'กำหนดค่าต่ำสุด',
                        labelText: 'กำหนดค่าต่ำสุด',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => maxNtu = value,
                      initialValue: ntu["max_ntu"].toString(),
                      decoration: const InputDecoration(
                        hintText: 'กำหนดค่าสูงสุด',
                        labelText: 'กำหนดค่าสูงสุด',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                  ),
                ],
              ),
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

                          try {
                            print(minPh);
                            print(maxPh);
                            double _minNut = double.parse(minNtu);
                            double _maxNut = double.parse(maxNtu);

                            _setSensorRef
                                .child("set_nut")
                                .update({"min_nut": _minNut});
                            _setSensorRef
                                .child("set_nut")
                                .update({"max_nut": _maxNut});
                          } catch (e) {
                            print(e);
                            Fluttertoast.showToast(
                                msg: "กรุณากรอกเป็นตัวเลข",
                                //toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
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

  Widget _changePh(dynamic ph) {
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
                "กำหนดค่า Ph",
                style: TextStyle(
                  fontSize: 18,
                  //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                  color: Colors.black, //font color
                  //background color
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => minPh = value,
                      initialValue: ph["min_ph"].toString(),
                      decoration: const InputDecoration(
                        hintText: 'กำหนดค่าต่ำสุด',
                        labelText: 'กำหนดค่าต่ำสุด',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => maxPh = value,
                      initialValue: ph["max_ph"].toString(),
                      decoration: const InputDecoration(
                        hintText: 'กำหนดค่าสูงสุด',
                        labelText: 'กำหนดค่าสูงสุด',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                  ),
                ],
              ),
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

                          try {
                            print(minPh);
                            print(maxPh);
                            double _minPh = double.parse(minPh);
                            double _maxPh = double.parse(maxPh);

                            _setSensorRef
                                .child("set_ph")
                                .update({"min_ph": _minPh});
                            _setSensorRef
                                .child("set_ph")
                                .update({"max_ph": _maxPh});
                          } catch (e) {
                            print(e);
                            Fluttertoast.showToast(
                                msg: "กรุณากรอกเป็นตัวเลข",
                                //toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
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

//ปรับอุณหภูมิ
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
                children: [Text(temperature.toString()), Text("°C")],
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

//ตั้งเวลาให้อาหาร
  Widget _changeTimeFeeder(dynamic time) {
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
                "เวลาให้อาหารล่าสุด",
                style: TextStyle(
                  fontSize: 18,
                  //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                  color: Colors.black, //font color
                  //background color
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //ชั่วโมง
                  Container(
                    child: Column(children: [
                      IconButton(
                          onPressed: () {
                            _readSensorRef.update({"time_feeder": time + 2});
                            _hour += 2;
                          },
                          icon: Icon(Icons.arrow_drop_up)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (time.toString()),
                            style: TextStyle(
                              fontSize: 25,
                              //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                              color: Colors.black, //font color
                              //background color
                            ),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            _readSensorRef.update({"time_feeder": time - 2});
                            _hour -= 2;
                          },
                          icon: Icon(Icons.arrow_drop_down)),
                    ]),
                  ),
                ],
              ),
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
                          _readSensorRef.update(
                              {"time_feeder": time - (_hour + _minute)});
                          _hour = 0;
                          _minute = 0;
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
}
