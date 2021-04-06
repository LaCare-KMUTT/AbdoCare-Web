import 'package:flutter/material.dart';

import '../../../../models/evalutate_form/pre_visit/radio_list.dart';

class TypeOfAnesthesia extends StatefulWidget {
  final FormFieldSetter<String> onSaved;
  TypeOfAnesthesia({this.onSaved});

  @override
  _TypeOfAnesthesiaState createState() =>
      _TypeOfAnesthesiaState(onSaved: onSaved);
}

class _TypeOfAnesthesiaState extends State<TypeOfAnesthesia> {
  final FormFieldSetter<String> onSaved;
  _TypeOfAnesthesiaState({this.onSaved});

  int _id;
  List list = getTypeOfAnesthesiaList();

  List<Widget> _getWidget() {
    return list.map((e) {
      return Expanded(
        flex: 2,
        child: Container(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('${e.text}'),
            value: e.index,
            groupValue: _id,
            onChanged: (newValue) {
              setState(() {
                _id = e.index;
              });
              String toSave = e.text;
              onSaved(toSave);
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
            child: Text('Type of Anesthesia',
                style: TextStyle(fontWeight: FontWeight.w600))),
        ..._getWidget(),
        Expanded(
          flex: 4,
          child: SizedBox(width: 0),
        )
      ],
    );
  }
}
