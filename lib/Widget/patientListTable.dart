import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class PatientListTable extends StatefulWidget {
  PatientListTable({Key key}) : super(key: key);
  @override
  _PatientListTableState createState() => _PatientListTableState();
}

class _PatientListTableState extends State<PatientListTable> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                    child: Container(
                      width: 180,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        textColor: Colors.black,
                        color: Color(0xFFDADADA),
                        padding: EdgeInsets.all(15),
                        child: Text('ลงทะเบียนผู้ป่วยใน',
                            style: TextStyle(fontSize: 16)),
                        onPressed: () {
                          print('This is add patient button');
                          setState(() {});
                          Navigator.pushNamed(context, '/addPatient_page');
                        },
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
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
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text('HN'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text('ชื่อ-นามสกุล'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text('ขั้นตอนการรักษา'),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            child: Column(
                              children: [
                                Text(' '),
                              ],
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
                      FutureBuilder<List<QueryDocumentSnapshot>>(
                        future: _firebaseService.getUserList(),
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
    );
  }

  Widget buildUserList(BuildContext context,
      AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          DocumentSnapshot user = snapshot.data[index];
          return Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 2.0, color: Colors.grey[300]),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        // Access the fields as defined in FireStore
                        title: Text(user.get('hn')),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 2.0, color: Colors.grey[300]),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        // Access the fields as defined in FireStore
                        title: Text(user.get('name')),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    FutureBuilder<Map<String, dynamic>>(
                        future: _firebaseService.getLatestAnSubCollection(
                            docId: user.id),
                        builder: (context, anSnapshot) {
                          if (!anSnapshot.hasData) {
                            return Text('loading...');
                          }
                          return ListTile(
                            title: anSnapshot.data['operationMethod'] != null
                                ? Text(anSnapshot.data['operationMethod'])
                                : Text('-'),
                          );
                        }),
                  ],
                ),
              ),
            ],
          );
        },
      );
    } else if (snapshot.connectionState == ConnectionState.done &&
        !snapshot.hasData) {
      return Center(
        child: Text("No users found."),
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
