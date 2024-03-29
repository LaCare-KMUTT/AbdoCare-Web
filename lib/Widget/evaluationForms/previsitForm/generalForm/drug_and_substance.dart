import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radioListTile_model.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/generalForm_radio_list.dart';
import 'package:flutter/material.dart';

class DrugAndSubstance extends StatefulWidget {
  final FormFieldSetter<String> onSavedDrugAndSubstance;

  DrugAndSubstance({this.onSavedDrugAndSubstance});
  @override
  _DrugAndSubstanceState createState() =>
      _DrugAndSubstanceState(onSavedDrugAndSubstance: onSavedDrugAndSubstance);
}

class _DrugAndSubstanceState extends State<DrugAndSubstance> {
  final FormFieldSetter<String> onSavedDrugAndSubstance;
  _DrugAndSubstanceState({this.onSavedDrugAndSubstance});

  final TextEditingController _controller = TextEditingController();

  int _id;
  bool isEnableTextField = false;
  String _drugAndSubstance = '-';
  List<RadioListTileModel> list1 = getDrugAndSubstanceList1();
  List<RadioListTileModel> list2 = getDrugAndSubStanceList2();
  List<Widget> _getWidget(List list) {
    const int CHOICE_DRUG_SEDATIVE = 2;
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
                if (newValue == CHOICE_DRUG_SEDATIVE) {
                  isEnableTextField = true;
                } else {
                  isEnableTextField = false;
                  _drugAndSubstance = e.text;
                  onSavedDrugAndSubstance(_drugAndSubstance);
                  _controller.clear();
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
            child: Text('Drug and substance',
                style: TextStyle(fontWeight: FontWeight.w600))),
        ..._getWidget(list1),
        Expanded(
          flex: 2,
          child: TextFormField(
            enabled: isEnableTextField,
            validator: (value) => isEnableTextField && value.isEmpty
                ? 'กรุณากรอกDrug sedative'
                : null,
            controller: _controller,
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'Drug sedative'),
            onSaved: (value) {
              if (isEnableTextField) {
                setState(() {
                  _drugAndSubstance = value ?? '-';
                });
                onSavedDrugAndSubstance(_drugAndSubstance);
              }
            },
          ),
        ),
        ..._getWidget(list2),
      ],
    );
  }
}
