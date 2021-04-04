import 'package:flutter/material.dart';

class ConsentSign extends StatefulWidget {
  final FormFieldSetter<String> onSaved;
  final String consentFromDb;
  ConsentSign({this.onSaved, this.consentFromDb});
  @override
  _ConsentSignState createState() =>
      _ConsentSignState(onSaved: onSaved, consentFromDb: consentFromDb);
}

class ConsentList {
  String text;
  int index;
  ConsentList({this.text, this.index});
}

class _ConsentSignState extends State<ConsentSign> {
  FormFieldSetter<String> onSaved;
  String consentFromDb;
  _ConsentSignState({this.onSaved, this.consentFromDb});

  int _id = 1;
  String item = 'Patient';
  bool isEnabled = false;
  List<ConsentList> list = [
    ConsentList(index: 1, text: 'Patient'),
    ConsentList(index: 2, text: 'Others'),
  ];
  List<Widget> getWidget() {
    return list.map((e) {
      return Expanded(
        flex: 2,
        child: Container(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('${e.text}'),
            value: e.text,
            groupValue: _id,
            onChanged: (newValue) {
              setState(() {
                if (newValue == 'Patient')
                  isEnabled = false;
                else {
                  isEnabled = true;
                }
                if (!isEnabled) {
                  item = e.text;
                  onSaved(item);
                }
              });
            },
          ),
        ),
      );
    }).toList();
  }

  @override
  void initState() {
    print('Consent from db$consentFromDb');
    super.initState();
    int init;
    if (consentFromDb == 'Patient') {
      init = 1;
    } else {
      init = 2;
    }
    setState(() {
      _id = init;
    });
    print(' id  = ==  $_id');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Text('Consent signed',
                style: TextStyle(fontWeight: FontWeight.w600))),
        ...getWidget(),
        Expanded(
          flex: 3,
          child: TextFormField(
            enabled: isEnabled,
            initialValue: consentFromDb == 'Others' ? null : consentFromDb,
            validator: (value) {
              return value.isEmpty ? 'กรุณากรอกConsent signed' : null;
            },
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'Other'),
            onSaved: (value) {
              onSaved(item);
            },
          ),
        ),
        Expanded(
          flex: 7,
          child: SizedBox(width: 0),
        )
      ],
    );
  }
}
