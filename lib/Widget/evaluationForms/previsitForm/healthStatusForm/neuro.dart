import 'package:flutter/material.dart';

import '../../../../models/evalutate_form/pre_visit/checkboxListTile_model.dart';
import '../../../../models/evalutate_form/pre_visit/healthStatusForm_model.dart';
import 'healthStatus_checkbox_list.dart';

class NeuroHealthStatus extends StatefulWidget {
  final HealthStatusFormModel healthStatusModel;
  NeuroHealthStatus({this.healthStatusModel});
  @override
  _NeuroHealthStatusState createState() => _NeuroHealthStatusState();
}

class _NeuroHealthStatusState extends State<NeuroHealthStatus> {
  bool _isEnableTextField = false;
  final List<CheckboxListTileModel> list = getNeuroList();

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
                    child: Text('NEURO'),
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
                                widget.healthStatusModel.neuro_Normal =
                                    list[index].value;
                                break;
                              case 'Migraine':
                                widget.healthStatusModel.neuro_Migraine =
                                    list[index].value;
                                break;
                              case 'Seizure':
                                widget.healthStatusModel.neuro_Seizure =
                                    list[index].value;
                                break;
                              case 'TIA/Stroke':
                                widget.healthStatusModel.neuro_TiaStorke =
                                    list[index].value;
                                break;
                              case 'Weakness/Syncope':
                                widget.healthStatusModel.neuro_WeaknessSyncope =
                                    list[index].value;
                                break;
                              case 'Sensory impairment':
                                widget.healthStatusModel
                                        .neuro_SensoryImpairment =
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
                              widget.healthStatusModel.neuro_Other = '-';
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
                            widget.healthStatusModel.neuro_Other = value,
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
