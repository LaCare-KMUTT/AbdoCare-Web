import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddAppointmentPage extends StatefulWidget {
  AddAppointmentPage({Key key}) : super(key: key);
  @override
  _AddAppointmentPageState createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      locale: Locale('th'),
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime.now().add(Duration(days: 356)),
      errorFormatText: 'ใส่วันที่ไม่ถูกต้อง กรุณาตรวจสอบและลองใหม่อีกครั้ง',
      fieldHintText: 'วัน/เดือน/ปี',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        print(selectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  width: 400,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'วัน เดือน ปีเกิด',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    validator: (value) {
                                      return value.isEmpty
                                          ? 'กรุณากรอกวันเกิด'
                                          : null;
                                    },
                                    // initialValue: pickedDate,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26, width: 1),
                                        ),
                                        labelText: 'วัน เดือน ปีเกิด'),
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      _selectDate(context);
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  tooltip: 'Tap to open date picker',
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                child: Text("ยืนยัน"),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Text("เพิ่มนัด", style: TextStyle(fontSize: 16)),
    );
  }
}
