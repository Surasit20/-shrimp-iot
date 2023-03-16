import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/model/profile.dart';
import 'package:flutter_app2/screen/home.dart';
import 'package:flutter_app2/screen/insertData.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import 'home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(
    email: '',
    password: '',
  );
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("เกิดข้อผิดพลาด"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Center(child: Text("สร้างบัญชี",style: GoogleFonts.inter(fontSize: 20),)),
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(30, 70, 30, 30),                 
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("อีเมล", style: GoogleFonts.inter(fontSize: 20)),
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
                              Text("รหัสผ่าน", style: GoogleFonts.inter(fontSize: 20)),
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
                                  child: Text("ลงทะเบียน",style: GoogleFonts.inter(fontSize: 20),),                                                             
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save(); /*ใส่ ?.*/
                                      print(
                                          "email = ${profile.email} password = ${profile.password}");
                                      try {
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                                email: profile.email,
                                                password: profile.password)
                                            .then((value) {
                                          formKey.currentState!.reset();
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return InsertDataScreen();
                                          }));
                                        });
                                        //Toast.show("ลงทะเบียนสำเร็จ", duration: Toast.lengthLong,gravity: Toast.bottom);
                                        //formKey.currentState!.reset();
                                        
                                      } on FirebaseAuthException catch (e) {
                                        //ถ้าผิดพลาดจะมีข้อความ
                                        print(e.code);
                                        print(e.message);
                              
                                        //Toast.show("error", duration: Toast.lengthLong,gravity: Toast.bottom);
                                        /*Fluttertoast.showToast(
                                            msg: "${e.message}",
                                            gravity: ToastGravity.CENTER);*/
                                      }
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
}
