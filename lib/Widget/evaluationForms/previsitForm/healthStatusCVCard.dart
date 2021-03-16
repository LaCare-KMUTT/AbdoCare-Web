import 'package:flutter/material.dart';

class CVCard extends StatefulWidget {
  CVCard({Key key}) : super(key: key);
  @override
  _CVCardState createState() => _CVCardState();
}

class _CVCardState extends State<CVCard> {
  var _value = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;
  var _value6 = false;
  var _value7 = false;

  String _cv = '';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
                  child: Text('CV'),
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
                  title: Text('Chest pain'),
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
                  title: Text('Palpitations'),
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
                  title: Text('Murmur'),
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
                  title: Text('PND/orthopnea'),
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
                  title: Text('LE swelling'),
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
                            _cv = '-';
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
                      onSaved: (value) => _cv = value,
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
