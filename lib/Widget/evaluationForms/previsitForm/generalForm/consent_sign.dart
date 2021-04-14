import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/generalForm_radio_list.dart';
import 'package:flutter/material.dart';

class ConsentSign extends StatefulWidget {
  final FormFieldSetter<String> onSaved;
  final String consentFromDb;
  ConsentSign({this.onSaved, this.consentFromDb});
  @override
  _ConsentSignState createState() =>
      _ConsentSignState(onSaved: onSaved, consentFromDb: consentFromDb);
}

class _ConsentSignState extends State<ConsentSign> {
  FormFieldSetter<String> onSaved;
  String consentFromDb;
  _ConsentSignState({this.onSaved, this.consentFromDb});

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
  void initState() {
    super.initState();
    int init;
    if (consentFromDb == 'Patient') {
      init = 1;
      isEnabled = false;
      item = 'Patient';
    } else {
      init = 2;
      isEnabled = true;
      item = 'Others';
    }
    setState(() {
      _id = init;
    });
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
            initialValue: consentFromDb == 'Others' ? null : consentFromDb,
            controller: _controller,
            validator: (value) =>
                isEnabled && value.isEmpty ? 'กรุณากรอกConsent signed' : null,
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
