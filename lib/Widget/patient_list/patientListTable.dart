import 'dart:async';
import 'dart:ui';

import 'package:AbdoCare_Web/Widget/shared/progress_bar.dart';
import 'package:AbdoCare_Web/models/user_list/patient_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';

class PatientListTable extends StatefulWidget {
  PatientListTable({Key key}) : super(key: key);
  @override
  _PatientListTableState createState() => _PatientListTableState();
}

class _PatientListTableState extends State<PatientListTable> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  Stream<QuerySnapshot> _list;
  String queryHN = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _list = _firebaseService.getUserStream();
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        child: Scaffold(
          body: Container(
            child: ListView(
              children: <Widget>[
                Row(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 9,
                            screenSize.height / 20, screenSize.height / 70, 0),
                        child: Container(
                          width: 180,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            textColor: Colors.white,
                            color: Colors.lightGreen,
                            padding: EdgeInsets.all(15),
                            child: Text('ลงทะเบียนผู้ป่วย',
                                style: TextStyle(fontSize: 18)),
                            onPressed: () {
                              setState(() {});
                              Navigator.pushNamed(context, '/addPatient_page');
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              screenSize.height / 7,
                              screenSize.height / 20,
                              screenSize.height / 70,
                              0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'ค้นหาผู้ป่วย:',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0,
                              screenSize.height / 20,
                              screenSize.height / 70,
                              0),
                          child: Container(
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z0-9]"))
                              ],
                              decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black26, width: 0.0)),
                                  contentPadding: EdgeInsets.all(10.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.0))),
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'HN'),
                              onChanged: (val) {
                                setState(() {
                                  queryHN = val.toUpperCase();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, screenSize.height / 20, screenSize.height / 9, 0),
                    child: Container(
                      child: RaisedButton(
                        child: Text("ค้นหา", style: TextStyle(fontSize: 18)),
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenSize.height / 10,
                      screenSize.height / 70, screenSize.height / 10, 0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(
                                      'HN',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(
                                      'ชื่อ-นามสกุล',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(
                                      'ขั้นตอนการรักษา',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 100,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[300],
                            height: 20,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: _list,
                            builder: buildUserList,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUserList(BuildContext context,
      AsyncSnapshot<QuerySnapshot> userCollectionSnapshot) {
    if (userCollectionSnapshot.connectionState == ConnectionState.waiting ||
        !userCollectionSnapshot.hasData) {
      return ProgressBar.circularProgressIndicator(context);
    } else {
      List<PatientListModel> patientListModels =
          userCollectionSnapshot.data.docs.map((patient) {
        PatientListModel model = PatientListModel(map: {
          'hn': patient.data()['hn'],
          'name': patient.data()['name'],
          'surname': patient.data()['surname'],
          'userId': patient.id,
          'anId': patient.data()['an'].last['an'],
        });

        return model;
      }).toList();
      patientListModels = patientListModels
          .where((patient) => patient.hn.contains(queryHN))
          .toList();

      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: patientListModels.length,
          itemBuilder: (context, index) {
            return _buildPatientRow(patientListModels[index], context);
          });
    }
  }

  Widget _buildPatientRow(PatientListModel patientModel, BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    patientModel.hn,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    '${patientModel.name} ${patientModel.surname}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: FutureBuilder<String>(
              future: _firebaseService.getStateForPatientList(
                  anId: patientModel.anId, userId: patientModel.userId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        snapshot.data,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                );
              }),
        ),
        Container(
          width: 100,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0)),
            textColor: Colors.white,
            color: Color(0xFFF69E51),
            child: Text('แก้ไข', style: TextStyle(fontSize: 18)),
            onPressed: () {
              Navigator.pushNamed(context, '/editPatient_page',
                  arguments: patientModel.hn);
            },
          ),
        ),
      ],
    );
  }
}
