import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> alertDialog(BuildContext context) async {
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
}
