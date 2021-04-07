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

  bool isEnableTextField = false;
  int _id;
  List<RadioListTileModel> list = getAntiPlateletList();

  List<Widget> _getWidget() {
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
                if (newValue == 1) {
                  isEnableTextField = false;
                  onSavedReason(e.text);
                }
                if (newValue == 2) {
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
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'On Anticoagulant/ Anti Platelet'),
            onSaved: (value) => onSavedReason(value),
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
            onSaved: (value) => onSavedDay(value ?? '-'),
          ),
        ),
        Expanded(child: Text(' Days')),
      ],
    );
  }
}
