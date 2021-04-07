import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radioListTile_model.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radio_list.dart';
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

  bool isEnableTextField = false;
  List<RadioListTileModel> list = getAllergyMedicationList();
  int _id;

  List<Widget> _getWidget() {
    return list.map((e) {
      return Expanded(
        flex: 1,
        child: Container(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('${e.text}'),
            value: e.index,
            groupValue: _id,
            onChanged: (newValue) {
              setState(() {
                _id = e.index;
                if (newValue == 1) {
                  onSavedAllergy(e.text);
                  isEnableTextField = false;
                }
                if (newValue == 2) {
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
            flex: 3,
            child: Text('Allergy Medication',
                style: TextStyle(fontWeight: FontWeight.w600))),
        ..._getWidget(),
        Expanded(
          flex: 3,
          child: TextFormField(
            enabled: isEnableTextField,
            validator: (value) {
              return value.isEmpty ? 'กรุณากรอกAllergy Medication' : null;
            },
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'Allergy Medication'),
            onSaved: (value) => onSavedAllergy(value),
          ),
        ),
        Expanded(child: Center(child: Text(' Symptoms '))),
        Expanded(
          flex: 2,
          child: TextFormField(
            enabled: isEnableTextField,
            validator: (value) {
              return value.isEmpty ? 'กรุณากรอกSymptoms' : null;
            },
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'Symptoms'),
            onSaved: (value) => onSavedSymptomps(value ?? '-'),
          ),
        ),
      ],
    );
  }
}
