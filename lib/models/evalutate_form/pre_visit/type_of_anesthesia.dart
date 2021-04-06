import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';

class TypeOfAnesthesia extends StatefulWidget {
  @override
  _TypeOfAnesthesiaState createState() => _TypeOfAnesthesiaState();
}

class TypeOfAnesthesiaModel {}

class _TypeOfAnesthesiaState extends State<TypeOfAnesthesia> {
  final _customMaterial = locator<CustomMaterial>();
  int typeOfAnesthesia;
  String _typeOfAnesthesia = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: _customMaterial.getEdgeInsetLTRB7070700(context),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Text('Type of Anesthesia',
                    style: TextStyle(fontWeight: FontWeight.w600))),
            Expanded(
              flex: 2,
              child: Container(
                child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('GA'),
                  value: 1,
                  groupValue: typeOfAnesthesia,
                  onChanged: (newValue) {
                    setState(() {
                      typeOfAnesthesia = newValue;
                      _typeOfAnesthesia = 'GA';
                      print(_typeOfAnesthesia);
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text('SB'),
                  value: 2,
                  groupValue: typeOfAnesthesia,
                  onChanged: (newValue) {
                    setState(() {
                      typeOfAnesthesia = newValue;
                      _typeOfAnesthesia = 'SB';
                      print(_typeOfAnesthesia);
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text('GA+SB'),
                  value: 3,
                  groupValue: typeOfAnesthesia,
                  onChanged: (newValue) {
                    setState(() {
                      typeOfAnesthesia = newValue;
                      _typeOfAnesthesia = 'GA+SB';
                      print(_typeOfAnesthesia);
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text('GA+Feneral nerve block'),
                  value: 4,
                  groupValue: typeOfAnesthesia,
                  onChanged: (newValue) {
                    setState(() {
                      typeOfAnesthesia = newValue;
                      _typeOfAnesthesia = 'GA+Feneral nerve block';
                      print(_typeOfAnesthesia);
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(width: 0),
            )
          ],
        ),
      ),
    );
  }
}
