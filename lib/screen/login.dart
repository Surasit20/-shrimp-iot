import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/screen/welcome.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:toast/toast.dart';
import '../model/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FToast fToast;
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(
    email: '',
    password: '',
  );
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    // fToast.init(navigatorKey.currentContext!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Center(child: Text("เข้าสู่ระบบ")),
              ),
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("อีเมล", style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(errorText: "กรุณาป้อน email"),
                                EmailValidator(
                                    errorText: "รูปแบบ email ไม่ถูกต้อง")
                              ]),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (String? email) {
                                profile.email = email!;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("รหัสผ่าน", style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "กรุณาป้อน password"),
                              obscureText: true,
                              onSaved: (String? password) {
                                profile.password = password!;
                              },
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: Text(" ลงชื่อเข้าใช้ "),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save(); /*ใส่ ?.*/
                                    print(
                                        "email = ${profile.email} password = ${profile.password}");
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: profile.email,
                                              password: profile.password)
                                          .then((value) {
                                        formKey.currentState!.reset();
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return WelcomeScreen();
                                        }));
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      //ถ้าผิดพลาดจะมีข้อความ
                                      print(e.message);
                                      Fluttertoast.showToast(
                                          msg: e.message.toString(),
                                          //toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      //Toast.show("error", duration: Toast.lengthLong,gravity: Toast.bottom);
                                      /*Fluttertoast.showToast(
                                          msg: "${e.message}",
                                          gravity: ToastGravity.CENTER);*/
                                    }
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "อีเมลหรือรหัสผ่านไม่ถูกต้อง",
                                        //toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ),
            );
          }
          ;
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(), //หน้าดาวน์โหลด
            ),
          );
        });
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );
  }
}
