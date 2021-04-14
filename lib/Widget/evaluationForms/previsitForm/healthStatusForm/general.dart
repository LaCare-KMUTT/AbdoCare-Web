import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusForm/healthStatus_checkbox_list.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/checkboxListTile_Model.dart';
import 'package:flutter/material.dart';

class GeneralHealthStatus extends StatefulWidget {
  @override
  _GeneralHealthStatusState createState() => _GeneralHealthStatusState();
}

class _GeneralHealthStatusState extends State<GeneralHealthStatus> {
  String _general = '';

  bool _generalValue1 = false;
  bool _generalValue2 = false;
  bool _generalValue3 = false;
  bool _generalValue4 = false;
  bool _generalValue5 = false;
  bool _generalValue6 = false;
  bool _generalValue7 = false;

  List<Widget> _getWidget() {
    List<CheckboxListTileModel> list = getGeneralList();

    return list.map((e) {
      return Container(
        child: CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: e.value,
          selected: e.value,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Color(0xFFC37447),
          onChanged: (value) {
            setState(() {
              _generalValue1 = value;
            });
          },
          title: Text('Normal'),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300])),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            height: screenSize.width / 4,
            width: screenSize.width / 5,
            child: ListView(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('GENERAL'),
                  ),
                ),
                Container(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _generalValue1,
                    selected: _generalValue1,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color(0xFFC37447),
                    onChanged: (value) {
                      setState(() {
                        _generalValue1 = value;
                      });
                    },
                    title: Text('Normal'),
                  ),
                ),
                Container(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _generalValue2,
                    selected: _generalValue2,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color(0xFFC37447),
                    onChanged: (value) {
                      setState(() {
                        _generalValue2 = value;
                      });
                    },
                    title: Text('Abnormal weight loss'),
                  ),
                ),
                Container(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _generalValue3,
                    selected: _generalValue3,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color(0xFFC37447),
                    onChanged: (value) {
                      setState(() {
                        _generalValue3 = value;
                      });
                    },
                    title: Text('Abnormal weight gain'),
                  ),
                ),
                Container(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _generalValue4,
                    selected: _generalValue4,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color(0xFFC37447),
                    onChanged: (value) {
                      setState(() {
                        _generalValue4 = value;
                      });
                    },
                    title: Text('Fever'),
                  ),
                ),
                Container(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _generalValue5,
                    selected: _generalValue5,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color(0xFFC37447),
                    onChanged: (value) {
                      setState(() {
                        _generalValue5 = value;
                      });
                    },
                    title: Text('Fatigue'),
                  ),
                ),
                Container(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _generalValue6,
                    selected: _generalValue6,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color(0xFFC37447),
                    onChanged: (value) {
                      setState(() {
                        _generalValue6 = value;
                      });
                    },
                    title: Text('Chills/Sweats'),
                  ),
                ),
                Container(
                    child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        value: _generalValue7,
                        selected: _generalValue7,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Color(0xFFC37447),
                        onChanged: (value) {
                          setState(() {
                            _generalValue7 = value;
                            if (_generalValue7 == false) {
                              _general = '-';
                            }
                          });
                        },
                        title: Text('Other:'),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        enabled: _generalValue7,
                        validator: (value) {
                          return value.isEmpty ? 'กรุณากรอก Other' : null;
                        },
                        decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 10.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 1),
                            ),
                            labelText: ' Other'),
                        onSaved: (value) => _general = value,
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
