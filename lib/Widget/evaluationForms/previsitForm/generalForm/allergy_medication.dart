import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radioListTile_model.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/generalForm_radio_list.dart';
import 'package:flutter/material.dart';

class AllergyMedication extends StatefulWidget {
  final FormFieldSetter<String> onSavedAllergy;
  final FormFieldSetter<String> onSavedSymptomps;

  AllergyMedication({this.onSavedAllergy, this.onSavedSymptomps});
  @override
  _AllergyMedicationState createState() => _AllergyMedicationState(
      onSavedAllergy: onSavedAllergy, onSavedSymptomps: onSavedSymptomps);
}

class _AllergyMedicationState extends State<AllergyMedication> {
  final FormFieldSetter<String> onSavedAllergy;
  final FormFieldSetter<String> onSavedSymptomps;
  _AllergyMedicationState({this.onSavedAllergy, this.onSavedSymptomps});

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  bool isEnableTextField = false;
  List<RadioListTileModel> list = getAllergyMedicationList();
  int _id;
  String _allergy = '-';
  String _symptomps = '-';

  List<Widget> _getWidget() {
    const int CHOICE_NO = 1;
    const int CHOICE_YES = 2;

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
                _id = e.index;
                _allergy = e.text;
                if (newValue == CHOICE_NO) {
                  onSavedAllergy(_allergy);
                  onSavedSymptomps('-');
                  isEnableTextField = false;
                  _controller1.clear();
                  _controller2.clear();
                }
                if (newValue == CHOICE_YES) {
                  isEnableTextField = true;
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
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Text('Allergy Medication',
                style: TextStyle(fontWeight: FontWeight.w600))),
        ..._getWidget(),
        Expanded(
          flex: 2,
          child: TextFormField(
            enabled: isEnableTextField,
            validator: (value) => isEnableTextField && value.isEmpty
                ? 'กรุณากรอกAllergy Medication'
                : null,
            controller: _controller1,
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'Allergy Medication'),
            onSaved: (value) {
              if (isEnableTextField) {
                setState(() {
                  _allergy = value;
                });
                onSavedAllergy(_allergy);
              }
            },
          ),
        ),
        Flexible(
            child: Center(
                child: Text(
          ' Symptoms ',
          style: TextStyle(fontSize: 16),
        ))),
        Expanded(
          flex: 2,
          child: TextFormField(
            enabled: isEnableTextField,
            validator: (value) =>
                isEnableTextField && value.isEmpty ? 'กรุณากรอกSymptoms' : null,
            controller: _controller2,
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'Symptoms'),
            onSaved: (value) {
              if (isEnableTextField) {
                setState(() {
                  _symptomps = value ?? '-';
                });
                onSavedSymptomps(_symptomps);
              }
            },
          ),
        ),
      ],
    );
  }
}
