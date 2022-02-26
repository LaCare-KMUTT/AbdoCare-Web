import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/generalForm_radio_list.dart';
import 'package:flutter/material.dart';

class ConsentSign extends StatefulWidget {
  final FormFieldSetter<String> onSaved;
  ConsentSign({this.onSaved});
  @override
  _ConsentSignState createState() => _ConsentSignState(onSaved: onSaved);
}

class _ConsentSignState extends State<ConsentSign> {
  FormFieldSetter<String> onSaved;
  _ConsentSignState({this.onSaved});

  final TextEditingController _controller = TextEditingController();

  int _id;
  String item = 'Patient';
  bool isEnabled = false;
  List list = getConsentSignList();

  List<Widget> getWidget() {
    const int CHOICE_OTHER = 2;
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
                if (newValue == CHOICE_OTHER) {
                  isEnabled = true;
                } else {
                  isEnabled = false;
                  _controller.clear();
                  item = e.text;
                  onSaved(item);
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
            child: Text('Consent signed',
                style: TextStyle(fontWeight: FontWeight.w600))),
        ...getWidget(),
        Expanded(
          flex: 3,
          child: TextFormField(
            enabled: isEnabled,
            controller: _controller,
            validator: (value) {
              if (isEnabled && value.isEmpty) {
                return 'กรุณากรอกConsent signed';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                labelText: 'Other'),
            onSaved: (value) {
              if (isEnabled) {
                setState(() {
                  item = value ?? '-';
                });
                onSaved(item);
              }
            },
          ),
        ),
      ],
    );
  }
}
