import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radioListTile_model.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/generalForm_radio_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SleepDisorder extends StatefulWidget {
  final FormFieldSetter<String> onSavedSleepDisorder;
  final FormFieldSetter<String> onSavedSleepDisorderDuration;
  final FormFieldSetter<String> onSavedSleepDisorderAvg;

  SleepDisorder(
      {this.onSavedSleepDisorder,
      this.onSavedSleepDisorderDuration,
      this.onSavedSleepDisorderAvg});
  @override
  _SleepDisorderState createState() => _SleepDisorderState(
      onSavedSleepDisorder: onSavedSleepDisorder,
      onSavedSleepDisorderDuration: onSavedSleepDisorderDuration,
      onSavedSleepDisorderAvg: onSavedSleepDisorderAvg);
}

class _SleepDisorderState extends State<SleepDisorder> {
  final FormFieldSetter<String> onSavedSleepDisorder;
  final FormFieldSetter<String> onSavedSleepDisorderDuration;
  final FormFieldSetter<String> onSavedSleepDisorderAvg;

  _SleepDisorderState(
      {this.onSavedSleepDisorder,
      this.onSavedSleepDisorderDuration,
      this.onSavedSleepDisorderAvg});

  final TextEditingController _controller = TextEditingController();

  int _id;
  int _id2;
  bool isEnableTextField = false;

  String _sleepDisorder = '-';
  String _sleepDisorderDuration = '-';
  String _sleepDisorderAvg = '-';

  List<RadioListTileModel> listDisorder = getSleepDisorderList();
  List<RadioListTileModel> listDisorderDuration =
      getSleepDisorderDurationList();

  List<Widget> _getWidget1() {
    const int CHOICE_NO = 1;

    return listDisorder.map((e) {
      return Expanded(
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
                  isEnableTextField = false;
                  _sleepDisorder = e.text;
                  onSavedSleepDisorder(_sleepDisorder);
                  onSavedSleepDisorderDuration('-');
                  onSavedSleepDisorderAvg('-');
                  _id2 = null;
                  _controller.clear();
                } else {
                  isEnableTextField = true;
                  _sleepDisorder = e.text;
                  onSavedSleepDisorder(_sleepDisorder);
                }
              });
            },
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _getWidget2() {
    return listDisorderDuration.map((e) {
      return Expanded(
        child: AbsorbPointer(
          absorbing: !isEnableTextField,
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('${e.text}'),
            value: e.index,
            groupValue: _id2,
            onChanged: (newValue) {
              setState(() {
                _id2 = e.index;
                _sleepDisorderDuration = e.text;
                onSavedSleepDisorderDuration(_sleepDisorderDuration);
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
            flex: 1,
            child: Text('Sleep disorder',
                style: TextStyle(fontWeight: FontWeight.w600))),
        ..._getWidget1(),
        Container(
            width: 100,
            child: Text('(Duration',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.black87))),
        ..._getWidget2(),
        Flexible(
            child: Text(', On average',
                style: TextStyle(fontSize: 16, color: Colors.black87))),
        Expanded(
          child: TextFormField(
            controller: _controller,
            enabled: isEnableTextField,
            validator: (value) => isEnableTextField && value.isEmpty
                ? 'กรุณากรอก On average'
                : null,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: ' On average'),
            onSaved: (value) {
              if (isEnableTextField) {
                setState(() {
                  _sleepDisorderAvg = value ?? '-';
                });
                onSavedSleepDisorderAvg(_sleepDisorderAvg);
              }
            },
          ),
        ),
        Container(
            width: 100,
            child: Text(' hr./night)',
                style: TextStyle(fontSize: 16, color: Colors.black87))),
      ],
    );
  }
}
