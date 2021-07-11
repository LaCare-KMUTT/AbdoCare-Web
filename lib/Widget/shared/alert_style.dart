import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day0/recovery_readiness_form.dart';
import 'package:flutter/material.dart';

import '../../page/dashboard_postHos.dart';
import '../../page/dashboard_pre.dart';

class Dialogs {
  static Future<void> alertToCompleteEvalutation(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("กรุณาทำแบบประเมินให้ครบถ้วน",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center),
            actions: [
              TextButton(
                child: Text('ตกลง'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]);
      },
    );
  }

  static Future<void> alertSuccessfullySavedData(
      BuildContext context, String hn, String patients) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(milliseconds: 500), () {
          print(patients);
          if (patients == "Post-Operation@Hospital") {
            return Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostHosDashboardPage(hn: hn)));
          } else if (patients == "Pre-Operation") {
            return Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PreDashboardPage(hn: hn)),
            );
          }
        });
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Icon(
              Icons.check_circle_outline_rounded,
              size: 100,
              color: Colors.greenAccent,
            ),
            content: Text("บันทึกข้อมูลสำเร็จ",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center));
      },
    );
  }

  static Future<void> alertToCompleteForm(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("กรุณากรอกข้อมูลให้ครบถ้วน",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center),
            actions: [
              TextButton(
                child: Text('ตกลง'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]);
      },
    );
  }

  static Future<void> alertDashboardDetail(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("ผู้ป่วยยังไม่มีข้อมูลในขั้นตอนการรักษานี้",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center),
            actions: [
              TextButton(
                child: Text('ตกลง'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]);
      },
    );
  }

  static Future<void> alertToCompleteRecoveryReadinessForm(
      BuildContext context, String hn, String status) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Column(
              children: [
                Text(
                    "ผู้ป่วยยังไม่ผ่านแบบประเมินความพร้อมในการฟื้นสภาพหลังผ่าตัด",
                    style: TextStyle(fontSize: 18, color: Color(0xFFC37447)),
                    textAlign: TextAlign.center),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                      "กรุณาทำแบบประเมินความพร้อมในการฟื้นสภาพหลังผ่าตัด",
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center),
                ),
              ],
            ),
            content: Builder(builder: (context) {
              return Container(
                height: 100,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child:
                          RecoveryReadinessForm(hn: hn, evaluateStatus: status),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[100],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPrimary: Color(0xFFC37447),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Center(
                            child:
                                Text("ยกเลิก", style: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
      },
    );
  }
}
