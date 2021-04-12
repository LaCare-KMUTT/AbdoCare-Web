import 'package:flutter/material.dart';

import '../../../../models/evalutate_form/pre_visit/adlForm_radio_list.dart';
import '../../../../models/evalutate_form/pre_visit/radioListTile_model.dart';
import '@enum.dart';

class ADLQuestions extends StatefulWidget {
  final FormFieldSetter<int> onSaved;
  final ADLTopic topic;
  ADLQuestions({this.onSaved, this.topic});
  @override
  _ADLQuestionsState createState() =>
      _ADLQuestionsState(onSaved: onSaved, topic: topic);
}

class _ADLQuestionsState extends State<ADLQuestions> {
  final FormFieldSetter<int> onSaved;
  final ADLTopic topic;
  _ADLQuestionsState({this.onSaved, this.topic});

  int _id;
  int _score = 0;

  List<Widget> _getWidget(Size screenSize, ADLTopic topic) {
    List<RadioListTileModel> list = _getList(topic);
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
                        _score = e.value;
                        onSaved(_score);
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

  List<RadioListTileModel> _getList(ADLTopic question) {
    List<RadioListTileModel> returnList = [];
    switch (question) {
      case ADLTopic.feeding:
        returnList = getFeedingList();
        break;
      case ADLTopic.grooming:
        returnList = getGroomingList();
        break;
      case ADLTopic.transfer:
        returnList = getTransferList();
        break;
      case ADLTopic.toiletUse:
        returnList = getToiletUseList();
        break;
      case ADLTopic.mobility:
        returnList = getMobilityList();
        break;
      case ADLTopic.dressing:
        returnList = getDressingList();
        break;
      case ADLTopic.stairs:
        returnList = getStairsList();
        break;
      case ADLTopic.bathing:
        returnList = getBathingList();
        break;
      case ADLTopic.bowels:
        returnList = getBowelsList();
        break;
      case ADLTopic.bladder:
        returnList = getBladderList();
        break;
    }
    return returnList;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        ..._getWidget(screenSize, topic),
      ],
    );
  }
}
