import 'package:flutter/material.dart';

import '../../../../models/evalutate_form/pre_visit/radioListTile_model.dart';
import '../../../../models/evalutate_form/pre_visit/radio_list.dart';

class AntiPlatelet extends StatefulWidget {
  final FormFieldSetter<String> onSavedDay;
  final FormFieldSetter<String> onSavedReason;

  AntiPlatelet({this.onSavedDay, this.onSavedReason});
  @override
  _AntiPlateletState createState() => _AntiPlateletState(
        onSavedDay: onSavedDay,
        onSavedReason: onSavedReason,
      );
}

class _AntiPlateletState extends State<AntiPlatelet> {
  final FormFieldSetter<String> onSavedDay;
  final FormFieldSetter<String> onSavedReason;

  _AntiPlateletState({this.onSavedDay, this.onSavedReason});

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  bool isEnableTextField = false;
  int _id;
  List<RadioListTileModel> list = getAntiPlateletList();
  String _reason = '-';
  String _day = '-';

  List<Widget> _getWidget() {
    const int CHOICE_NO = 1;
    const int CHOICE_YES = 2;

    return list.map((e) {
      return Expanded(
        flex: 1,
        child: Container(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('${e.text}'),
            value: e.index,
            groupValue: _id,
            onChanged: (newValue) {
              setState(() {
                _id = e.index;
                if (newValue == CHOICE_NO) {
                  _reason = e.text;
                  isEnableTextField = false;
                  onSavedReason(_reason);
                  _controller1.clear();
                  _controller2.clear();
                }
                if (newValue == CHOICE_YES) {
                  isEnableTextField = true;
                }
              });
            },
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Text('On Anticoagulant/ Anti Platelet',
                style: TextStyle(fontWeight: FontWeight.w600))),
        ..._getWidget(),
        Expanded(
          flex: 3,
          child: TextFormField(
            enabled: isEnableTextField,
            validator: (value) {
              return value.isEmpty ? 'กรุณากรอกAnti Platelet' : null;
            },
            controller: _controller1,
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'On Anticoagulant/ Anti Platelet'),
            onSaved: (value) {
              if (isEnableTextField) {
                setState(() {
                  _reason = value ?? '-';
                });
                onSavedReason(_reason);
              }
            },
          ),
        ),
        Expanded(child: Center(child: Text(' Off '))),
        Expanded(
          flex: 1,
          child: TextFormField(
            enabled: isEnableTextField,
            validator: (value) {
              return value.isEmpty ? 'กรุณากรอกDays' : null;
            },
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'Days'),
            controller: _controller2,
            onSaved: (value) {
              if (isEnableTextField) {
                setState(() {
                  _day = value ?? '-';
                });
                onSavedDay(_day);
              }
            },
          ),
        ),
        Expanded(child: Text(' Days')),
      ],
    );
  }
}
