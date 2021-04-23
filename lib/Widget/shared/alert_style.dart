import 'package:AbdoCare_Web/page/dashboard_postHos.dart';
import 'package:AbdoCare_Web/page/dashboard_pre.dart';
import 'package:flutter/material.dart';

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
              FlatButton(
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
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 1), () {
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
              FlatButton(
                child: Text('ตกลง'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]);
      },
    );
  }
}
