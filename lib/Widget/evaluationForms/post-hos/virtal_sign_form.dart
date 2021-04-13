import 'package:AbdoCare_Web/services/interfaces/calculation_service_interface.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VirtalSignForm extends StatefulWidget {
  final String hn;
  final String formTime;
  final String state;
  final double dayInCurrentState;
  VirtalSignForm(
      {Key key,
      @required this.hn,
      @required this.formTime,
      @required this.state,
      this.dayInCurrentState})
      : super(key: key);

  @override
  _VirtalSignFormState createState() => _VirtalSignFormState();
}

class _VirtalSignFormState extends State<VirtalSignForm> {
  ICalculationService _calculationService = locator<ICalculationService>();
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  final _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();

  double _bt;
  double _pr;
  double _rr;
  String _bp;
  String _systolic;
  String _diastolic;
  double _pain;
  LinearGradient gradient = LinearGradient(
    colors: <Color>[
      Colors.greenAccent[400],
      Colors.orangeAccent[400],
      Colors.redAccent[700],
    ],
  );
  @override
  Widget build(BuildContext context) {
    var dateToShow = _calculationService.formatDateToThaiString(
        date: date, isBuddhist: false);
    var timeToShow = DateFormat.Hm().format(DateTime.now()).toString();

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: RaisedButton(
        child: Text(widget.formTime, style: TextStyle(fontSize: 15)),
        padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        onPressed: () {
          print('แบบประเมินสัญญาณชีพ: ${widget.hn}');
          print("${widget.state} Day: ${widget.dayInCurrentState}");
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Container(
                    width: 500,
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Positioned(
                              right: 0.0,
                              top: 0.0,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  child: Icon(Icons.close),
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('แบบประเมินสัญญาณชีพ ',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Color(0xFFC37447))),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('$dateToShow'),
                                        Text('\tเวลา $timeToShow น.'),
                                        (() {
                                          if (widget.state == 'Pre-Operation') {
                                            return Text('\t ${widget.state}  ');
                                          } else {
                                            return Text(
                                                '\t ${widget.state} day: ${widget.dayInCurrentState} ');
                                          }
                                        }())
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text('BT:\t\t',
                                              textAlign: TextAlign.end),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกหมายเลขBT'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'BT'),
                                            onSaved: (value) =>
                                                _bt = double.parse(value),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1, child: Text('\t\t °C'))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text('PR:\t\t',
                                              textAlign: TextAlign.end),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกหมายเลขPR '
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'PR '),
                                            onSaved: (value) =>
                                                _pr = double.parse(value),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1, child: Text('\t\t bpm'))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text('RR:\t\t',
                                              textAlign: TextAlign.end),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกหมายเลขRR'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'RR'),
                                            onSaved: (value) =>
                                                _rr = double.parse(value),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Text('\t\t bpm\t\t'))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text('BP:\t\t',
                                              textAlign: TextAlign.end),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกหมายเลขSystolic'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'Systolic'),
                                            onChanged: (value) =>
                                                _systolic = value,
                                          ),
                                        ),
                                        Container(
                                            width: 20,
                                            child: Text(
                                              '/',
                                              textAlign: TextAlign.center,
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกหมายเลขDiastolic'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'Diastolic'),
                                            onChanged: (value) =>
                                                _diastolic = value,
                                          ),
                                        ),
                                        Expanded(flex: 1, child: Text(' mmHg')),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text('Pain:\t\t',
                                              textAlign: TextAlign.end),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: DropdownButtonFormField(
                                            isDense: true,
                                            isExpanded: true,
                                            validator: (value) => value == null
                                                ? 'กรุณาเลือกPain'
                                                : null,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'Pain'),
                                            onSaved: (value) {
                                              _pain = double.parse(value);
                                            },
                                            items: [
                                              '1',
                                              '2',
                                              '3',
                                              '4',
                                              '5',
                                              '6',
                                              '7',
                                              '8',
                                              '9',
                                              '10'
                                            ]
                                                .map(
                                                    (label) => DropdownMenuItem(
                                                          child: Text(label),
                                                          value: label,
                                                        ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _pain = double.parse(value);
                                              });
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(width: 0),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0)),
                                        textColor: Colors.white,
                                        padding: EdgeInsets.all(15),
                                        color: Color(0xFF2ED47A),
                                        child: Text('ยืนยัน',
                                            style: TextStyle(fontSize: 18)),
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            _formKey.currentState.save();
                                            _bp = '$_systolic' +
                                                '/' +
                                                '$_diastolic';
                                            print(_bp);
                                            Map<String, dynamic> dataToDB = {
                                              'bt': _bt,
                                              'pr': _pr,
                                              'rr': _rr,
                                              'bp': _bp,
                                              'pain': _pain,
                                            };
                                            print(
                                                'hn in Virtal-Sign = ${widget.hn}');
                                            print(
                                                'Value in pain_form = $_pain ');

                                            _firebaseService
                                                .addDataToFormsCollection(
                                                    hn: widget.hn,
                                                    formName: 'Virtal-Sign',
                                                    data: dataToDB);

                                            // if ((_anSubCollection['state'] ==
                                            //             'Post-Operation@Hospital' &&
                                            //         value >= 7) ||
                                            //     (_anSubCollection['state'] ==
                                            //             'Post-Operation@Home' &&
                                            //         value >= 4)) {
                                            //   showAdvise1(context, value,
                                            //       _anSubCollection['state']);
                                            //   if (checkNotificationCriteria(
                                            //       value)) {
                                            //     var creation =
                                            //         _calculationService
                                            //             .formatDate(
                                            //                 date:
                                            //                     DateTime.now());
                                            //     var patientState =
                                            //         _anSubCollection['state'];
                                            //     _firebaseService
                                            //         .addNotification({
                                            //       'formName': 'pain',
                                            //       'formId': formId,
                                            //       'userId': UserStore
                                            //           .getValueFromStore(
                                            //               'storedUserId'),
                                            //       'creation': creation,
                                            //       'patientState': patientState,
                                            //       'seen': false,
                                            //     });
                                            //   }
                                            // }
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
