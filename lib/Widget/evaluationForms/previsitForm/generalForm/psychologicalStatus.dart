import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radioListTile_model.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radio_list.dart';
import 'package:flutter/material.dart';

class PsychologicalStatus extends StatefulWidget {
  final FormFieldSetter<String> onSavedPsychologicalStatus;

  PsychologicalStatus({this.onSavedPsychologicalStatus});
  @override
  _PsychologicalStatusState createState() => _PsychologicalStatusState(
      onSavedPsychologicalStatus: onSavedPsychologicalStatus);
}

class _PsychologicalStatusState extends State<PsychologicalStatus> {
  final FormFieldSetter<String> onSavedPsychologicalStatus;
  _PsychologicalStatusState({this.onSavedPsychologicalStatus});

  int _id;
  bool isEnableTextField = false;

  List<RadioListTileModel> list = getPsychologicalStatusList();

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
                if (newValue == 4) {
                  isEnableTextField = true;
                } else {
                  isEnableTextField = false;
                  onSavedPsychologicalStatus(e.text);
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
            flex: 2,
            child: Text('Psychological status',
                style: TextStyle(fontWeight: FontWeight.w600))),
        ..._getWidget(),
        Expanded(
          flex: 5,
          child: TextFormField(
            enabled: isEnableTextField,
            validator: (value) {
              return value.isEmpty ? 'กรุณากรอกPsychological Status' : null;
            },
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'Psychological Status '),
            onSaved: (value) => onSavedPsychologicalStatus(value),
          ),
        ),
      ],
    );
  }
}
