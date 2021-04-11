import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radioListTile_model.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radio_list.dart';
import 'package:flutter/material.dart';

class AllergyToLatex extends StatefulWidget {
  final FormFieldSetter<String> onSavedAllergyLatex;

  AllergyToLatex({this.onSavedAllergyLatex});
  @override
  _AllergyToLatexState createState() =>
      _AllergyToLatexState(onSavedAllergyLatex: onSavedAllergyLatex);
}

class _AllergyToLatexState extends State<AllergyToLatex> {
  final FormFieldSetter<String> onSavedAllergyLatex;

  _AllergyToLatexState({this.onSavedAllergyLatex});

  final TextEditingController _controller = TextEditingController();

  int _id;
  bool isEnableTextField = false;
  String _allergyLatex = '-';

  List<RadioListTileModel> list = getAllergyLatexList();

  List<Widget> _getWidget() {
    const int CHOICE_OTHERS = 6;

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
                _allergyLatex = e.text;
                if (newValue == CHOICE_OTHERS) {
                  isEnableTextField = true;
                } else {
                  isEnableTextField = false;
                  onSavedAllergyLatex(_allergyLatex);
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
            child: Text('Allergy to Latex',
                style: TextStyle(fontWeight: FontWeight.w600))),
        ..._getWidget(),
        Expanded(
          child: TextFormField(
            enabled: isEnableTextField,
            validator: (value) => isEnableTextField && value.isEmpty
                ? 'กรุณากรอกAllergy to Latex'
                : null,
            controller: _controller,
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'Allergy to Latex '),
            onSaved: (value) {
              if (isEnableTextField) {
                setState(() {
                  _allergyLatex = value ?? '-';
                });
                onSavedAllergyLatex(_allergyLatex);
              }
            },
          ),
        ),
      ],
    );
  }
}
