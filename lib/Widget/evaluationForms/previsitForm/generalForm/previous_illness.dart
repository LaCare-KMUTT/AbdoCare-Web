import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radio_list.dart';
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

  _PreviousIllnessState({this.onSaved});
  final CustomMaterial _customMaterial = locator<CustomMaterial>();

  bool enableTextField = false;

  List list1 = getPreviousIllnessList1();
  List list2 = getPreviousIllnessList2();

  int _id;

  List<Widget> _getWidget(List list) {
    const int indexOfOther = 8;
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
                newValue == indexOfOther
                    ? enableTextField = true
                    : enableTextField = false;

                print('ENABLED TEXT FIELD $enableTextField');
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
    return Column(
      children: [
        Container(
          child: Padding(
            padding: _customMaterial.getEdgeInsetLTRB7070700(context),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: Text('Previous illness',
                        style: TextStyle(fontWeight: FontWeight.w600))),
                ..._getWidget(list1),
                Expanded(
                  flex: 2,
                  child: SizedBox(width: 0),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: _customMaterial.getEdgeInsetLTRB7070700(context),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SizedBox(width: 0),
                ),
                ..._getWidget(list2),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    enabled: enableTextField,
                    validator: (value) {
                      return value.isEmpty ? 'กรุณากรอกPrevious Illness' : null;
                    },
                    decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 1),
                        ),
                        labelText: 'Other'),
                    onSaved: (value) => onSaved(value),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: 0,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}