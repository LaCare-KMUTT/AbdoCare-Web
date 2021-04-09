import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/adlForm_radio_list.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radioListTile_model.dart';
import 'package:flutter/material.dart';

class GroomingADL extends StatefulWidget {
  final FormFieldSetter<int> onSaved;
  GroomingADL({this.onSaved});
  @override
  _GroomingADLState createState() => _GroomingADLState(onSaved: onSaved);
}

class _GroomingADLState extends State<GroomingADL> {
  final FormFieldSetter<int> onSaved;
  _GroomingADLState({this.onSaved});

  List<RadioListTileModel> list = getGroomingList();

  int _id;
  int _groomingScore = 0;

  List<Widget> _getWidget(screenSize) {
    return list.map((e) {
      return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(screenSize.height / 10,
              screenSize.height / 70, screenSize.height / 70, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('${e.text}'),
                    value: e.index,
                    groupValue: _id,
                    onChanged: (newValue) {
                      setState(() {
                        _id = e.index;
                        _groomingScore = e.value;
                        onSaved(_groomingScore);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        ..._getWidget(screenSize),
      ],
    );
  }
}
