import 'package:flutter/material.dart';
import 'package:flutter_app2/screen/login.dart';
import 'package:flutter_app2/screen/register.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),*/
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 130, 30, 30), //ระยะปุ่ม
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "แอพพลิเคชั่นสำหรับ",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
              Text(
                "การควบคุมระบบของตู้เลี้ยงกุ้งเครฟิช",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
              Image.asset("assets/images/crayfish.png"),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("สร้างบัญชี",
                      style: GoogleFonts.inter(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterScreen();
                    }));
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("เข้าสู่ระบบ",
                      style: GoogleFonts.inter(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
