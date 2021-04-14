import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/generalForm_radio_list.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
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
  final CustomMaterial _customMaterial = locator<CustomMaterial>();

  bool isEnableTextField = false;

  List list1 = getPreviousIllnessList1();
  List list2 = getPreviousIllnessList2();
  String _toSave = '-';
  int _id;

  List<Widget> _getWidget(List list) {
    const int CHOICE_OTHER = 8;
    return list.map((e) {
      return Expanded(
        child: Container(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('${e.text}'),
            value: e.index,
            groupValue: _id,
            onChanged: (newValue) {
              setState(() {
                if (newValue == CHOICE_OTHER) {
                  isEnableTextField = true;
                } else {
                  isEnableTextField = false;
                  _toSave = e.text;
                  _controller.clear();
                  onSaved(_toSave);
                }
                _id = e.index;
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
