import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Procambarus extends StatelessWidget {
  const Procambarus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Text("กลุ่มสายพันธุ์ P (Procambarus) จำนวน 11 ชนิด ได้แก่"),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("โกสต์ (Clarkll ghost) "),
                Text(
                    "-	โกสต์เป็นเครย์ฟิชไม่ได้เกิดจากธรรมชาติ แต่เกิดจากการ บรีดดิ่ง จนให้สีนิ่ง โดยมนุษย์เรา โกสต์มีหลายแพทเทิร์น ไม่ว่าจะเป็นแพทเทิร์นดั่งเดิม สายด่าง สายม่วง (แต่ไม่ว่าจะเป็นแพทเทิร์นไหน ก็ต้องยังคงลักษณะของโกสต์) "),
                Image.asset("assets/images/Clarkll ghost.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด เกิดจากการบรีดดิ่ง"),
                        Text("- อายุ 1-2 ปี"),
                        Text("- อุณภูมิในการเลี้ยง 20-27 c"),
                        Text("- ขนาดที่โตเต็มที่ 3-4 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("เคลีย (Clarkll clear)"),
                Text(
                    "-โกสต์เป็นเครย์ฟิชไม่ได้เกิดจากธรรมชาติ แต่เกิดจากการ บรีดดิ่ง เช่นเดียวกับโกสต์ ลักษณะเด่น แก้ม ลำตัว หาง จะมีสีอ่อน และ ขา หนวด จะมีสีเหมือนบำตัว"),
                Image.asset("assets/images/Clarkll clear.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด บรีดดิ่ง"),
                        Text("- อายุ 1-2 ปี"),
                        Text("- อุณภูมิในการเลี้ยง 20-27 c"),
                        Text("- ขนาดที่โตเต็มที่ 3-4 นิ้วโดยประมาณ"),
                      ]),
                ),
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("เคลีย (Clarkll clear)"),
                Text(
                    "-โกสต์เป็นเครย์ฟิชไม่ได้เกิดจากธรรมชาติ แต่เกิดจากการ บรีดดิ่ง เช่นเดียวกับโกสต์ ลักษณะเด่น แก้ม ลำตัว หาง จะมีสีอ่อน และ ขา หนวด จะมีสีเหมือนบำตัว"),
                Image.asset("assets/images/Clarkll orange ghost.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ฝีมือของคนไทย"),
                        Text("- อายุ 1-2 ปี"),
                        Text("- อุณภูมิในการเลี้ยง 20-27 c"),
                        Text("- ขนาดที่โตเต็มที่ 3-4 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            //////////////////
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("ไบค์ออเร้น (Bright Orange)"),
                Text(
                    "-เครย์ฟิชสายพันธุ์นี้เรียกว่า ไบค์ออเร้น ลักษณะมีสีส้มเข้ม มีขายทั่วไป ราคา ไม่แพง เลี้ยงง่าย"),
                Image.asset("assets/images/Bright Orange.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ทางตอนใต้ของสหรัฐอเมริกา"),
                        Text("- อายุ 1-2 ปี"),
                        Text("- อุณภูมิในการเลี้ยง 20-27 c"),
                        Text("- ขนาดที่โตเต็มที่ 3-4 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),

            //////////////////
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("เรดเจเปน (Red Japan)"),
                Text(
                    "-เครย์ฟิชสายพันธุ์นี้เรียกว่า เรดเจเปน ลักษณะมีสีแดงเข้ม มีขายทั่วไป ราคา ไม่แพง เลี้ยงง่าย"),
                Image.asset("assets/images/Red Japan.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ทางตอนใต้ของสหรัฐอเมริกา"),
                        Text("- อายุ 1-2 ปี"),
                        Text("- อุณภูมิในการเลี้ยง 20-27 c"),
                        Text("- ขนาดที่โตเต็มที่ 3-4 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("สโนว์ไวท์ (Snow white)"),
                Text(
                    "-เครย์ฟิชสายพันธุ์นี้เรียกว่า สโนว์ไวท์ มีลักษณะ ลำตัวสีขาว หรือสีขาวนวล "),
                Image.asset("assets/images/Snow white.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ทางตอนใต้ของสหรัฐอเมริกา"),
                        Text("- อายุ 1-2 ปี"),
                        Text("- อุณภูมิในการเลี้ยง 20-27 c"),
                        Text("- ขนาดที่โตเต็มที่ 3-4 นิ้วโดยประมาณ"),
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
                Text("อัลเลนี่ (Alleni)"),
                Text(
                    "-เครย์ฟิชสายพันธุ์นี้เรียกว่า อัลเลนี่ ลักษณะมีสีฟ้าเข้ม ทนต่อสภาพน้ำ ปรับตัวได้ง่าย เป็นสัตว์ที่กินไม่เลือก ตัวผู้จะยาวกว่าตัวเมีย"),
                Image.asset("assets/images/Alleni.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด รัฐฟลอริดา ประเทศสหรัฐอเมริกา"),
                        Text("- อายุ 1-2 ปี"),
                        Text("- อุณภูมิในการเลี้ยง 20-27 c"),
                        Text("- ขนาดที่โตเต็มที่ 3-4 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("มาโมเครบส์ (Marmorkrebs)"),
                Text(
                    "-สายพันธุ์นี้พบเจอครั้งแรกที่ตลาดซื้อขายปลาที่เยอรมัน เป็นกุ้งที่สามารถขยายพันธุ์ได้เองโดยไม่อาศัยตัวผู้ เลี้ยงง่าย แพร่พันธุ์ได้เร็ว ลักษณะมีสีน้ำเงินและสีน้ำตาล"),
                Image.asset("assets/images/Marmorkrebs.png"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ประเทศจอเจียและฟลอริด้า"),
                        Text("- อายุ 1-2 ปี"),
                        Text("- อุณภูมิในการเลี้ยง 20-27 c"),
                        Text("- ขนาดที่โตเต็มที่ 3-4 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("อีโน (Enoplosternum)"),
                Text(
                    "-เครย์ฟิชชนิดนี้ผู้เลี้ยงต้องให้ความสำคัญคุณภาพน้ำเป็นพิเศษ เนื่องจากไม่สามารถอดทนอาศัยน้ำคุณภาพต่ำได้ เป็นกุ้งที่ผสมพันธุ์ได้ไว"),
                Image.asset("assets/images/Enoplosternum.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ประเทศสหรัฐอเมริกา"),
                        Text("- อายุ 1-2 ปี"),
                        Text("- อุณภูมิในการเลี้ยง 10-27 c"),
                        Text("- ขนาดที่โตเต็มที่ 2-3 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("Versutus"),
                Text(
                    "-ทนต่อสภาพน้ำได้ดี ไม่ก้าวร้าว การลอกคราบในบางครั้ง จะสลับจากสีน้ำตาลเป็นสีฟ้า แต่สีมักไม่คงที่"),
                Image.asset("assets/images/Versutus.jpg"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ประเทศเม็กซิโก"),
                        Text("- อายุ 1-2 ปี"),
                        Text("- อุณภูมิในการเลี้ยง 10-22 c"),
                        Text("- ขนาดที่โตเต็มที่ 2-3 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.fromLTRB(7, 20, 7, 5),
              child: Column(children: [
                Text("Vasquezae"),
                Text(
                    "-ทนต่อสภาพน้ำได้ดี ไม่ก้าวร้าว การลอกคราบในบางครั้ง จะสลับจากสีน้ำตาลเป็นสีฟ้า แต่สีมักไม่คงที่"),
                Image.asset("assets/images/Vasquezae.png"),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ถิ่นกำเนิด ประเทศเม็กซิโก"),
                        Text("- อายุ 1-2 ปี"),
                        Text("- อุณภูมิในการเลี้ยง 10-22 c"),
                        Text("- ขนาดที่โตเต็มที่ 2-2.5 นิ้วโดยประมาณ"),
                      ]),
                )
              ]),
            ),
          ],
        )),
      ),
    );
  }
}
