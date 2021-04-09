import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/adlForm_radio_list.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radioListTile_model.dart';
import 'package:flutter/material.dart';

class FeedingADL extends StatefulWidget {
  @override
  _FeedingADLState createState() => _FeedingADLState();
}

List<RadioListTileModel> list = getFeedingList();

int feeding;
int score1;
String _feeding = '';

class _FeedingADLState extends State<FeedingADL> {
  List<Widget> _getWidget(screenSize) {
    return list.map((e) {
      return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(screenSize.height / 10,
              screenSize.height / 70, screenSize.height / 70, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title:
                        Text('0 ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้'),
                    value: 0,
                    groupValue: feeding,
                    onChanged: (newValue) {
                      setState(() {
                        feeding = newValue;
                        score1 = 0;
                        _feeding =
                            '0 ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้';
                        print(_feeding);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      // Container(
      //   child: Padding(
      //     padding:
      //         EdgeInsets.fromLTRB(
      //             screenSize
      //                     .height /
      //                 10,
      //             screenSize
      //                     .height /
      //                 70,
      //             screenSize
      //                     .height /
      //                 70,
      //             0),
      //     child: Row(
      //       children: [
      //         Expanded(
      //           child: Container(
      //             child:
      //                 RadioListTile(
      //               contentPadding:
      //                   EdgeInsets
      //                       .zero,
      //               title: Text(
      //                   '1 ตักอาหารเองได้แต่ต้องมีคนช่วย เช่น ช่วยใช้ช้อนตักเตรียมไว้ให้หรือตัดเป็นเล็กๆไว้ล่วงหน้า  '),
      //               value: 1,
      //               groupValue:
      //                   feeding,
      //               onChanged:
      //                   (newValue) {
      //                 setState(() {
      //                   feeding =
      //                       newValue;
      //                   score1 = 1;
      //                   _feeding =
      //                       '1ตักอาหารเองได้แต่ต้องมีคนช่วย เช่น ช่วยใช้ช้อนตักเตรียมไว้ให้หรือตัดเป็นเล็กๆไว้ล่วงหน้า  ';
      //                   print(
      //                       _feeding);
      //                 });
      //               },
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // Container(
      //   child: Padding(
      //     padding:
      //         EdgeInsets.fromLTRB(
      //             screenSize
      //                     .height /
      //                 10,
      //             screenSize
      //                     .height /
      //                 70,
      //             screenSize
      //                     .height /
      //                 70,
      //             0),
      //     child: Row(
      //       children: [
      //         Expanded(
      //           child: Container(
      //             child:
      //                 RadioListTile(
      //               contentPadding:
      //                   EdgeInsets
      //                       .zero,
      //               title: Text(
      //                   '2 ตักอาหารและช่วยตัวเองได้เป็นปกติ'),
      //               value: 2,
      //               groupValue:
      //                   feeding,
      //               onChanged:
      //                   (newValue) {
      //                 setState(() {
      //                   feeding =
      //                       newValue;
      //                   score1 = 2;
      //                   _feeding =
      //                       '2 ตักอาหารและช่วยตัวเองได้เป็นปกติ';
      //                   print(
      //                       _feeding);
      //                 });
      //               },
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [..._getWidget(screenSize)],
    );
  }
}
