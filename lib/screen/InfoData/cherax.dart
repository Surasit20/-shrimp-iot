import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cherax extends StatelessWidget {
  const Cherax({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Text("ตระกูลสาย C (Cherax) จำนวน 10 ชนิด ได้แก่"),
            Image.asset("assets/images/C (Cherax).png"),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("เดสทรัคเตอร์ (Destructor)"),
                Text(
                    "- เป็นกุ้งที่มีความคล้ายคลึงกับบลูเพิร์ล แต่ต่างกันตรงที่มีหลายสี น้ำเงินเข้ม น้ำตาลไหม้ น้ำตาลเขียว น้ำตาลกาแฟ สีดำ สีขาว "),
                Image.asset("assets/images/Destructor.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ออสเตรเลีย"),
                        Text("- อายุ 4-8 ปี ในธรรมชาติ 2-3 ปี ในตู้เลี้ยง"),
                        Text(
                            "- อุณภูมิในการเลี้ยง 20-26 c แต่ไทยเลี้ยง 26-28 c"),
                        Text("- ขนาดที่โตเต็มที่ 6-8 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("บลูเพิร์ล (Albidus)"),
                Text(
                    "- เป็นกุ้งที่เลี้ยงน้ำค่อนข้างเย็นก้าวร้าวน้อย ลํกษณะที่สังเกตได้ สีเปลือกจะมีสีฟ้าจนฟ้าเข็ม ก้ามหนา ใหญ่ ข้อก้ามขาว ตาดำสนิท ด้านในก้ามขะมีขน ปัจจุบันได้มีการพัฒนาให้กุ้งนั้นสามารถปรับสภาพให้เข้ากับประเทศไทย"),
                Image.asset("assets/images/Albidus.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ออสเตรเลีย"),
                        Text("- อายุ 4-8 ปี ในธรรมชาติ 2-3 ปี ในตู้เลี้ยง"),
                        Text(
                            "- อุณภูมิในการเลี้ยง 18-26 c แต่ไทยเลี้ยง 26-30 c"),
                        Text("- ขนาดที่โตเต็มที่ 6-8 นิ้วโดยประมาณ"),
                      ]),
                ),
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("ก้ามแดง (Quadricarinatis)"),
                Text(
                    "--	เป็นกุ้งชนิดแรกที่นำเข้าไทยโดย พระบาทสมเด็จพระเจ้าอยู่หัว ได้นำมาทดลองเลี้ยงเพื่อเป็นอาหารเป็นกุ้งที่มีการเจริญเติบโตค่อนข้างเร็ว ลักษณะเด่น ขนาดใหญ่ สีเปลี่ยนแปลงตลอด แต่ส่วนมากมีสีเขียว น้ำตาล น้ำเงิน และแถบด้านข้างของก้ามจะมีสีแดง ส้ม "),
                Image.asset("assets/images/Quadricarinatis.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ออสเตรเลีย"),
                        Text("-	อายุ 4 ปี"),
                        Text(
                            "-	อุณภูมิในการเลี้ยง 25-28 c แต่ไทยเลี้ยง 26-30 c"),
                        Text("-	ขนาดที่โตเต็มที่ 12 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            //////////////////
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("ไตรคัลเลอร์ (SP. Tri – Color)"),
                Text(
                    "-เป็นกุ้งที่มีสีไม่ชัดเจน ช่วงแรกหัวและตัว มีสีน้ำตาล ก้ามสัน้ำเงิน หางสีส้ม แต่ปัจจุบันมีมากกว่า 3 สี"),
                Image.asset("assets/images/SP. Tri – Color.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("-	ถิ่นกำเนิด ปาปัวนิวกินี และ อีเรียจายา"),
                        Text("-	อายุ 4 ปี ในธรรมชาติ 1-2 ปี ในตู้เลี้ยง"),
                        Text(
                            "-	อุณภูมิในการเลี้ยง 25-28 c แต่ไทยเลี้ยง 26-30 c"),
                        Text("-	ขนาดที่โตเต็มที่ 5-6 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),

            //////////////////
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("นิวเรด (Sp. Red Brick ( New Red )"),
                Text(
                    "-	ลักษณะเด่น ลำตัวมีสีแดงเลือดหมู ก้ามใหญ่ แถบของก้าม มีสีขาวหรือสีครีม แต่กุ้งชนิดนี้จะมี 2 แบบ คือกุ้งที่แดงทั้งตัวและกุ้งที่แดงแค่หัวแต่ตัวจะออกเขียวผสมเทา ซึ่งที่เรียกว่า อิเรียนไทเกอร์ หรือ บลูบริก"),
                Image.asset("assets/images/Sp. Red Brick (New Red ).jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("-	ถิ่นกำเนิด ปาปัวนิวกินี และ อีเรียจายา"),
                        Text("-	อายุ 4 ปี ในธรรมชาติ 1-2 ปี ในตู้เลี้ยง"),
                        Text(
                            "-	อุณภูมิในการเลี้ยง  25-28 c แต่ไทยเลี้ยง 26-30 c"),
                        Text("-	ขนาดที่โตเต็มที่ 5-8 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("ออเร้นเทล เพอเพิล (Orange Tail)"),
                Text(
                    "-	ลักษณะ ก้าม หัว ลำตัว มีสีดำ กลางมีมีส้ม แต่เมื่อนำมาเลี้ยงในประเทศไทย ลำตัวจึงเปลี่ยนเป็นสีฟ้า สีน้ำเงิน สีม่วง"),
                Image.asset("assets/images/Orange Tail.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ปาปัวนิวกินี และ อีเรียจายา"),
                        Text("-	อายุ 4 ปี ในธรรมชาติ 1-2 ปี ในตู้เลี้ยง"),
                        Text(
                            "-	อุณภูมิในการเลี้ยง 25-28 c แต่ไทยเลี้ยง 26-30 c"),
                        Text("-	ขนาดที่โตเต็มที่ 5-6 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            //////////////
            ///
            ///
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("ม้าลาย (Peknyi)"),
                Text(
                    "- เป็นกุ้งที่ค่อนข้างเลี้ยงง่าย กุ้งมีลายเป็นปล้องดำขีดขาวเหมือนม้าลาย นิสัยก้าวร้าว ก้ามใหญ่สีขาว และฟ้าผสม"),
                Image.asset("assets/images/Peknyi.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("-	ถิ่นกำเนิด ปาปัวนิวกินี และ อีเรียจายา"),
                        Text("-	อายุ 4 ปี "),
                        Text(
                            "-	อุณภูมิในการเลี้ยง 25-28 c แต่ไทยเลี้ยง 26-30 c"),
                        Text("-	ขนาดที่โตเต็มที่ 5-6 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("บลูมูน (Sp. Blue Moon))"),
                Text(
                    "-	กุ้งมีสีน้ำเงินเข้มผสมเทา มีจุดขาวบริเวณลำตัว ก้ามสีน้ำเงินเข้ม ขอบก้ามครีม ขาสีน้ำเงิน ปลายหางสีส้มเหลือง"),
                Image.asset("assets/images/Marmorkrebs.png"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("-	ถิ่นกำเนิด ปาปัวนิวกินี และ อีเรียจายา"),
                        Text("-	อายุ 4 ปี"),
                        Text(
                            "-	อุณภูมิในการเลี้ยง 25-28 c แต่ไทยเลี้ยง 26-30 c"),
                        Text("-	ขนาดที่โตเต็มที่ 6-10 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("แอปปิค็อต (Holthuisi)"),
                Text(
                    "- มีสีส้มทั้งตัว ทั้งเข้มและอ่อน เจริญเติบโตช้า เลี้ยงยาก"),
                Image.asset("assets/images/Holthuisi.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("-	ถิ่นกำเนิด ปาปัวนิวกินี และ อีเรียจายา"),
                        Text("-	อายุ 4 ปี"),
                        Text(
                            "-	อุณภูมิในการเลี้ยง 25-28 c แต่ไทยเลี้ยง 26-30 c"),
                        Text("-	ขนาดที่โตเต็มที่ 5-6 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("อีเรียน จายา (Sp. Irian Jaya)"),
                Text(
                    "-มีสีน้ำเงินเข้ม หลังมีสีน้ำเงินเข้ม ก้ามใหญ่ สีน้ำเงินเข้มมีแถบสีครีมของก้าม"),
                Image.asset("assets/images/Sp. Irian Jaya.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ปาปัวนิวกินี และ อีเรียจายา"),
                        Text("- อายุ 1-2 ปี"),
                        Text(
                            "-	อุณภูมิในการเลี้ยง 25-28 c แต่ไทยเลี้ยง 26-30 c"),
                        Text("-	ขนาดที่โตเต็มที่ 5-6 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
          ],
        )),
      ),
    );
  }
}
