import 'dart:html';

import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusForm/healthStatus_checkbox_list.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/checkboxListTile_Model.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/healthStatusForm_model.dart';
import 'package:flutter/material.dart';

class GeneralHealthStatus extends StatefulWidget {
  final HealthStatusFormModel data;
  GeneralHealthStatus({this.data});
  @override
  _GeneralHealthStatusState createState() => _GeneralHealthStatusState();
}

class _GeneralHealthStatusState extends State<GeneralHealthStatus> {
  bool _isEnableTextField = false;

  Map<String, dynamic> answer = {};
  final List<CheckboxListTileModel> list = getGeneralList();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300])),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            height: screenSize.width / 4,
            width: screenSize.width / 5,
            child: ListView(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('GENERAL'),
                  ),
                ),
                ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return Container(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        value: list[index].value,
                        selected: list[index].value,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Color(0xFFC37447),
                        onChanged: (value) {
                          setState(() {
                            list[index].value = value;
                            print(
                                'Check ${list[index].title}   ${list[index].value} is ${list[index].value} value = $value');
                            switch (list[index].title) {
                              case 'Normal':
                                widget.data.general_Normal = list[index].value;
                                break;
                              case 'Abnormal weight loss':
                                widget.data.general_AbnormalWeightLost =
                                    list[index].value;
                                break;
                              case 'Abnormal weight gain':
                                widget.data.general_AbnormalWeightGain =
                                    list[index].value;
                                break;
                              case 'Fever':
                                widget.data.general_Fever = list[index].value;
                                break;
                              case 'Fatigue':
                                widget.data.general_Fatigue = list[index].value;
                                break;
                              case 'Chills/Sweats':
                                widget.data.general_ChillsSweats =
                                    list[index].value;
                                break;
                            }
                          });
                        },
                        title: Text('${list[index].title}'),
                      ),
                    );
                  },
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        value: _isEnableTextField,
                        selected: _isEnableTextField,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Color(0xFFC37447),
                        onChanged: (value) {
                          setState(() {
                            _isEnableTextField = value;
                            if (_isEnableTextField == false) {
                              widget.data.general_Other = '-';
                            }
                          });
                        },
                        title: Text('Other:'),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        enabled: _isEnableTextField,
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
                        onSaved: (value) => widget.data.general_Other = value,
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
