import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/generalForm_checkbox_list.dart';
import 'package:flutter/material.dart';

class PreviousIllness extends StatefulWidget {
  final FormFieldSetter<String> onSaved;

  PreviousIllness({this.onSaved});
  @override
  _PreviousIllnessState createState() =>
      _PreviousIllnessState(onSaved: onSaved);
}

class _PreviousIllnessState extends State<PreviousIllness> {
  final FormFieldSetter<String> onSaved;

  final TextEditingController _controller = TextEditingController();

  _PreviousIllnessState({this.onSaved});
  bool isEnableTextField = false;
  List list1 = getPreviousIllnessList1();
  List list2 = getPreviousIllnessList2();
  String _toSave = '';
  List previousIllness = [];
  int count = 0;
  String stringList;
  List<Widget> _getWidget(List list) {
    return list.map((e) {
      return Expanded(
        child: Container(
          child: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: e.value,
            selected: e.value,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Color(0xFFC37447),
            title: Text('${e.title}'),
            onChanged: (newValue) {
              setState(() {
                count++;
                e.value = newValue;
                if (newValue == true) {
                  if (count == 1) {
                    previousIllness.add(e.title);
                    stringList = previousIllness.join("");
                    _toSave = stringList;
                  } else if (count > 1) {
                    previousIllness.add(e.title);
                    stringList = previousIllness
                        .reduce((value, element) => value + ',' + element);
                    _toSave = stringList;
                  }
                  _controller.clear();
                  onSaved(_toSave);
                }
                if (newValue == false) {
                  previousIllness.remove(e.title);
                  stringList = previousIllness
                      .reduce((value, element) => value + ',' + element);
                  _toSave = stringList;
                  _controller.clear();
                  onSaved(_toSave);
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
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text('Previous illness',
                        style: TextStyle(fontWeight: FontWeight.w600))),
                ..._getWidget(list1),
              ],
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(width: 0),
                ),
                ..._getWidget(list2),
                Expanded(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: isEnableTextField,
                    selected: isEnableTextField,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color(0xFFC37447),
                    onChanged: (value) {
                      setState(() {
                        isEnableTextField = value;
                      });
                    },
                    title: Text('Other:'),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    enabled: isEnableTextField,
                    validator: (value) => isEnableTextField && value.isEmpty
                        ? 'กรุณากรอกPrevious Illness'
                        : null,
                    controller: _controller,
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 1),
                        ),
                        labelText: 'Other'),
                    onSaved: (value) {
                      if (isEnableTextField) {
                        setState(() {
                          _toSave = value ?? '-';
                        });
                        onSaved(_toSave);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: SizedBox(width: 0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
