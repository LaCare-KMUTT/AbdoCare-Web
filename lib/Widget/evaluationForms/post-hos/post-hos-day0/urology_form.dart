import 'package:AbdoCare_Web/services/interfaces/calculation_service_interface.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';

class UrologyForm extends StatefulWidget {
  final String hn;
  UrologyForm({Key key, @required this.hn}) : super(key: key);

  @override
  _UrologyFormState createState() => _UrologyFormState();
}

class _UrologyFormState extends State<UrologyForm> {
  ICalculationService _calculationService = locator<ICalculationService>();
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  var _value1;
  String result;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: RaisedButton(
        child: Text("แบบประเมิน", style: TextStyle(fontSize: 15)),
        padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        onPressed: () {
          print('แบบประเมินระบบปัสสาวะ: ${widget.hn}');
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      width: 600,
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
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('แบบประเมินระบบปัสสาวะ',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Color(0xFFC37447))),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            'ทำเครื่องหมาย √ ตามความเป็นจริงภายใน 6-8 ชั่วโมงหลังการผ่าตัด'),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 20, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'ประเมินระบบปัสสาวะ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text('ถ่ายปัสสาวะแล้ว'),
                                          value: 'ถ่ายปัสสาวะแล้ว',
                                          activeColor: Color(0xFFC37447),
                                          groupValue: _value1,
                                          onChanged: (value) {
                                            setState(() {
                                              _value1 = value;
                                            });
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text('ยังไม่ถ่ายปัสสาวะ'),
                                          value: 'ยังไม่ถ่ายปัสสาวะ',
                                          activeColor: Color(0xFFC37447),
                                          groupValue: _value1,
                                          onChanged: (value) {
                                            setState(() {
                                              _value1 = value;
                                            });
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text(
                                              'ปวดปัสสาวะแต่ถ่ายไม่ออก ต้องการความช่วยเหลือจากเจ้าหน้าที่'),
                                          value:
                                              'ปวดปัสสาวะแต่ถ่ายไม่ออก ต้องการความช่วยเหลือจากเจ้าหน้าที่',
                                          activeColor: Color(0xFFC37447),
                                          groupValue: _value1,
                                          onChanged: (value) {
                                            setState(() {
                                              _value1 = value;
                                            });
                                          }),
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
                                          onPressed: () async {
                                            if (_value1 == null) {
                                              alert(context);
                                            } else {
                                              Map<String, dynamic>
                                                  formDataToDB = {
                                                'Exercise1': _value1,
                                              };
                                              print(
                                                  'hn in Urology = ${widget.hn}');
                                              var formId =
                                                  await _firebaseService
                                                      .addDataToFormsCollection(
                                                          hn: widget.hn,
                                                          formName: 'Urology',
                                                          data: formDataToDB);

                                              if (_value1 ==
                                                  "ถ่ายปัสสาวะแล้ว") {
                                                result = "Pass";
                                              } else {
                                                result = "NoPass";
                                                // var creation = _calculationService.formatDate(
                                                //     date: DateTime.now());
                                                // var patientState = _anSubCollection['state'];
                                                // _firebaseService.addNotification({
                                                //   'formName': 'Urology',
                                                //   'formId': formId,
                                                //   'userId':
                                                //       UserStore.getValueFromStore('storedUserId'),
                                                //   'creation': creation,
                                                //   'patientState': patientState,
                                                //   'seen': false,
                                                // });
                                              }
                                              Navigator.pop(context);
                                            }
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                );
              });
        },
      ),
    );
  }

  void alert(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("กรุณาทำแบบประเมินให้ครบถ้วน",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center),
          );
        });
  }
}
