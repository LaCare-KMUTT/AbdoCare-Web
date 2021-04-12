import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radioListTile_model.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/generalForm_radio_list.dart';
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

  final TextEditingController _controller = TextEditingController();

  int _id;
  bool isEnableTextField = false;
  List<RadioListTileModel> list = getPsychologicalStatusList();
  String _psycologicalStatus = '-';
  List<Widget> _getWidget() {
    const int CHOICE_OTHERS = 4;
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
                if (newValue == CHOICE_OTHERS) {
                  isEnableTextField = true;
                } else {
                  isEnableTextField = false;
                  _psycologicalStatus = e.text;
                  onSavedPsychologicalStatus(_psycologicalStatus);
                  _controller.clear();
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
            controller: _controller,
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'Psychological Status '),
            onSaved: (value) {
              if (isEnableTextField) {
                setState(() {
                  _psycologicalStatus = value ?? '-';
                });
                onSavedPsychologicalStatus(_psycologicalStatus);
              }
            },
          ),
        ),
      ],
    );
  }
}
