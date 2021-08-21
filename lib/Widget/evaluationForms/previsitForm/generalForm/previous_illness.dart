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
  String _toSave = '-';

  List<Widget> _getWidget(List list) {
    //const int CHOICE_OTHER = 8;
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
            //value: e.index,
            onChanged: (newValue) {
              setState(() {
                e.value = newValue;
                if (newValue) {
                  _toSave = e.title;
                  _controller.clear();
                  onSaved(_toSave);
                  print(_toSave);
// print(
//                                 'Check ${e.title}   ${e.value} is ${e.value} value = $newValue');
//                             switch (e.title) {
//                               case 'DM':
//                                 widget.healthStatusModel.cv_Normal =
//                                     e.value;
//                                 break;
//                               case 'HT':
//                                 widget.healthStatusModel.cv_ChestPain =
//                                     e.value;
//                                 break;
//                               case 'DLP':
//                                 widget.healthStatusModel.cv_Palpitations =
//                                     e.value;
//                                 break;
//                               case 'Heart disease':
//                                 widget.healthStatusModel.cv_Murmur =
//                                     e.value;
//                                 break;
//                               case 'Lung disease':
//                                 widget.healthStatusModel.cv_PNDOrthopnea =
//                                     e.value;
//                                 break;
//                               case 'Hematologic abnormality':
//                                 widget.healthStatusModel.cv_LEswelling =
//                                     e.value;
//                                 break;
//                               case 'Renal disease':
//                                 widget.healthStatusModel.cv_LEswelling =
//                                     e.value;
//                                 break;
//                             }
//                           });
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
