import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/adlForm_radio_list.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radioListTile_model.dart';
import 'package:flutter/material.dart';

class FeedingADL extends StatefulWidget {
  final FormFieldSetter<int> onSaved;
  FeedingADL({this.onSaved});
  @override
  _FeedingADLState createState() => _FeedingADLState(onSaved: onSaved);
}

class _FeedingADLState extends State<FeedingADL> {
  final FormFieldSetter<int> onSaved;
  _FeedingADLState({this.onSaved});

  List<RadioListTileModel> list = getFeedingList();

  int _id;
  int _feedingScore = 0;

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
                        _feedingScore = e.value;
                        onSaved(_feedingScore);
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
