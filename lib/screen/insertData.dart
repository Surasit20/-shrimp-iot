import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/screen/profile.dart';
import 'package:google_fonts/google_fonts.dart';

const List<String> list = <String>[
  '---เลือกสายพันธุ์---',
  'โกสต์ (P.Clarkll ghost)',
  'เคลีย (P.Clarkll clear)',
  'โกสต์ส้ม (P.Clarkll orange ghost)',
  'ไบค์ออเร้น (P.Bright Orange)',
  'เรดเจเปน (P.Red Japan)',
  'สโนว์ไวท์ (P.Snow white)',
  'อัลเลนี่ (P.Alleni)',
  'มาโมเครบส์ (P.Marmorkrebs)',
  'อีโน (P.Enoplosternum)',
  'P.Versutus',
  'P.Vasquezae',
  'เดสทรัคเตอร์ (C.Destructor)',
  'บลูเพิร์ล (C.Albidus)',
  'ก้ามแดง (C.Quadricarinatis)',
  'ไตรคัลเลอร์ (SP.Tri_Color)',
  'นิวเรด (Sp.Red Brick (New Red))',
  'ออเร้นเทล เพอเพิล (C.Orange Tail)',
  'ม้าลาย (C.Peknyi)',
  'บลูมูน (Sp.Blue Moon)',
  'แอปปิค็อต (C.Holthuisi)',
  'อีเรียน จายา (Sp.Irian Jaya)'
];

class InsertDataScreen extends StatelessWidget {
  const InsertDataScreen({Key? key}) : super(key: key);

  @override
  //_InsertDataScreenState createState() => _InsertDataScreenState();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("กรอกข้อมูล"), //child: InsertData(),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 30),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  //margin:  EdgeInsets.fromLTRB(20, 0, 0, 20),
                  child: Text(
                    "ข้อมูลกุ้งเครฟิชที่เลี้ยงในระบบ",
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        color: Color(0xff000000)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Container(
                  child: SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset(
                      "assets/images/crayfishin.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 204, 2),
                child: Text(
                  "สายพันธุ์",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(6, 0, 55, 15),
                decoration: BoxDecoration(
                border: Border.all(color: Color(0xcc000000)),
                color: Color(0xcc000000),
              ),
                padding: const EdgeInsets.fromLTRB(20, 2, 17.84, 10),
                child: InsertData(),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 181, 2),
                child: Text(
                  "ขนาดตัวกุ้ง",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 47, 4),
                width: 253,
                height: 40,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(165, 0, 0, 27),
                child: Text(
                  "*โดยประมาณ",
                  style: GoogleFonts.inter(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffb6b6b6),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(86, 0, 133, 0),
                padding: EdgeInsets.fromLTRB(26, 6, 4, 8),
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("บันทึก",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return ProfileScreen();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//setState(String Function() param0) {}

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  _InsertDataState createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  String? dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      //isExpanded: true,
      elevation: 18,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      underline: Container(
        height: 2,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      onChanged: (String? value) => setState(() => dropdownValue = value!),
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}









































                   /* child: DropdownButton<String>(
                      value: selectedItem,
                      items: items.map((item) => DropdownMenuItem<String>(
                                value: item,
                                child:
                                    Text(item, style: TextStyle(fontSize: 18)),
                              ))
                          .toString(),
                      onChanged: (item) => setState(() => selectedItem = item),
                    ),
                    SearchField(
                      hint: 'ค้นหา',
                      searchInputDecoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey.shade200,
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(18)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue.withOpacity(0.8),
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(18)
                        )
                      ),
                      itemHeight: 50,
                      maxSuggestionsInviewPort: 6,
                      SuggestionsDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)

                      ),
                      suggestions: [
                      'โกสต์ (Clarkll ghost)',
                      'เคลีย (Clarkll clear)',
                    ]),*/
             

  /* String? item;
  List Items = [
    'โกสต์ (Clarkll ghost)',
    'เคลีย (Clarkll clear)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: DropdownButton(
            value: item,
            items: Items.map((item) => DropdownMenuItem(value: item,child: Text(item))).toList(),
            onChanged: (value) => setState(() => item = value.toString()),
          ),
        ),
      ),
    );
  }
}*/
