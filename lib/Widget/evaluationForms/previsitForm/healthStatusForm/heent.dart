import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusForm/healthStatus_checkbox_list.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/checkboxListTile_model.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/healthStatusForm_model.dart';
import 'package:flutter/material.dart';

class HeentHealthStatus extends StatefulWidget {
  final HealthStatusFormModel healthStatusModel;
  HeentHealthStatus({this.healthStatusModel});
  @override
  _HeentHealthStatusState createState() => _HeentHealthStatusState();
}

bool _isEnableTextField = false;

final List<CheckboxListTileModel> list = getHeentList();

class _HeentHealthStatusState extends State<HeentHealthStatus> {
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
                    child: Text('HEENT'),
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
                                widget.healthStatusModel.heent_Normal =
                                    list[index].value;
                                break;
                              case 'Headache':
                                widget.healthStatusModel.heent_Headache =
                                    list[index].value;
                                break;
                              case 'Blurred vision':
                                widget.healthStatusModel.heent_BlurredVision =
                                    list[index].value;
                                break;
                              case 'Tinnitus':
                                widget.healthStatusModel.heent_Tinnitus =
                                    list[index].value;
                                break;
                              case 'Dizziness':
                                widget.healthStatusModel.heent_Dizziness =
                                    list[index].value;
                                break;
                              case 'Epistaxis':
                                widget.healthStatusModel.heent_Epistaxis =
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
                              widget.healthStatusModel.heent_Other = '-';
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
                        onSaved: (value) =>
                            widget.healthStatusModel.heent_Other = value,
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