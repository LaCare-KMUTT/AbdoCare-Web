import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusGeneralCard.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusHeentCard.dart';

import 'package:flutter/material.dart';

import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../customMaterial.dart';

class HealthStatusBody extends StatefulWidget {
  HealthStatusBody({Key key}) : super(key: key);
  @override
  _HealthStatusBodyState createState() => _HealthStatusBodyState();
}

class _HealthStatusBodyState extends State<HealthStatusBody> {
  ICalculationService _calculationService = locator<ICalculationService>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();
  var _value = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;
  var _value6 = false;
  var _value7 = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(screenSize.height / 70,
                  screenSize.height / 70, screenSize.height / 70, 0),
              child: Row(
                children: [
                  Expanded(
                      child: Text('Health Status',
                          style: TextStyle(fontWeight: FontWeight.w600))),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[300])),
                child: checkbox(
                  'GENERAL',
                  _value,
                  _value2,
                  _value3,
                  _value4,
                  _value5,
                  _value6,
                  _value7,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[300])),
                child: HeentCard(),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[300])),
                child: Column(
                  children: [
                    Text("CV"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[300])),
                child: Column(
                  children: [
                    Text("PULMONARY"),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[300])),
                child: Text("GYN/URO"),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[300])),
                child: Text("NEURO"),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[300])),
                child: Text("GI"),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[300])),
                child: Text("MS"),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[300])),
                child: Text("ENDOCRINE"),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[300])),
                child: Text("LYMPH"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget checkbox(String title, bool _value, bool _value2, bool _value3,
      bool _value4, bool _value5, bool _value6, bool _value7) {
    var screenSize = MediaQuery.of(context).size;
    String other = '';
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          height: screenSize.width / 4,
          width: screenSize.width / 4,
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
                  value: _value,
                  selected: _value,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Color(0xFFC37447),
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  title: Text('Normal'),
                ),
              ),
              Container(
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _value2,
                  selected: _value2,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Color(0xFFC37447),
                  onChanged: (value) {
                    setState(() {
                      _value2 = value;
                    });
                  },
                  title: Text('Abnormal weight loss'),
                ),
              ),
              Container(
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _value3,
                  selected: _value3,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Color(0xFFC37447),
                  onChanged: (value) {
                    setState(() {
                      _value3 = value;
                    });
                  },
                  title: Text('Abnormal weight gain'),
                ),
              ),
              Container(
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _value4,
                  selected: _value4,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Color(0xFFC37447),
                  onChanged: (value) {
                    setState(() {
                      _value4 = value;
                    });
                  },
                  title: Text('Fever'),
                ),
              ),
              Container(
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _value5,
                  selected: _value5,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Color(0xFFC37447),
                  onChanged: (value) {
                    setState(() {
                      _value5 = value;
                    });
                  },
                  title: Text('Fatigue'),
                ),
              ),
              Container(
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _value6,
                  selected: _value6,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Color(0xFFC37447),
                  onChanged: (value) {
                    setState(() {
                      _value6 = value;
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
                      value: _value7,
                      selected: _value7,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value7 = value;
                          if (_value7 == false) {
                            other = '-';
                          }
                        });
                      },
                      title: Text('Other:'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      enabled: _value7,
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
                      onSaved: (value) => other = value,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ],
    );
  }
}
