import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/radioListTile_model.dart';
import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/generalForm_radio_list.dart';
import 'package:flutter/material.dart';

class ASAClass extends StatefulWidget {
  final FormFieldSetter<String> onSaved;

  ASAClass({this.onSaved});
  @override
  _ASAClassState createState() => _ASAClassState(onSaved: onSaved);
}

class _ASAClassState extends State<ASAClass> {
  final FormFieldSetter<String> onSaved;
  _ASAClassState({this.onSaved});
  List<RadioListTileModel> list = getAsaClassList();
  int _id;
  String _asaClass = '';
  List<Widget> _getWidget(Size screenSize) {
    return list.map((e) {
      return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              screenSize.height / 7, 0, screenSize.height / 70, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('${e.text}'),
                  value: e.index,
                  groupValue: _id,
                  onChanged: (newValue) {
                    setState(() {
                      _id = e.index;
                      _asaClass = e.value;
                      onSaved(_asaClass);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        ..._getWidget(screenSize),
      ],
    );
  }
}
