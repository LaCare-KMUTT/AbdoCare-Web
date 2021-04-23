import 'package:flutter/material.dart';

import '../../../../models/evalutate_form/pre_visit/checkboxListTile_model.dart';
import '../../../../models/evalutate_form/pre_visit/healthStatusForm_model.dart';
import 'healthStatus_checkbox_list.dart';

class GYNUROHealthStatus extends StatefulWidget {
  final HealthStatusFormModel healthStatusModel;
  GYNUROHealthStatus({this.healthStatusModel});
  @override
  _GYNUROHealthStatusState createState() => _GYNUROHealthStatusState();
}

class _GYNUROHealthStatusState extends State<GYNUROHealthStatus> {
  bool _isEnableTextField = false;
  final List<CheckboxListTileModel> list = getGYNUROList();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
            child: Text('GYN/URO'),
          ),
          Container(
            height: screenSize.width / 4,
            width: screenSize.width / 5,
            child: ListView(
              children: <Widget>[
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
                                widget.healthStatusModel.gynuro_Normal =
                                    list[index].value;
                                break;
                              case 'Dysuria':
                                widget.healthStatusModel.gynuro_Dysuria =
                                    list[index].value;
                                break;
                              case 'Frequency':
                                widget.healthStatusModel.gynuro_Frequency =
                                    list[index].value;
                                break;
                              case 'Urgency':
                                widget.healthStatusModel.gynuro_Urgency =
                                    list[index].value;
                                break;
                              case 'Hematuria':
                                widget.healthStatusModel.gynuro_Hematuria =
                                    list[index].value;
                                break;
                              case 'Pelvic pain':
                                widget.healthStatusModel.gynuro_PelvicPain =
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
                              widget.healthStatusModel.gynuro_Other = '-';
                            }
                          });
                        },
                        title: Text('Other:'),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        enabled: _isEnableTextField,
                        validator: (value) {
                          return _isEnableTextField && value.isEmpty
                              ? 'กรุณากรอก Other'
                              : null;
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
                            widget.healthStatusModel.gynuro_Other = value,
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
