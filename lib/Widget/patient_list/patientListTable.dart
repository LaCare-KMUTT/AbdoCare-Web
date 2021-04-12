import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';

class PatientListTable extends StatefulWidget {
  PatientListTable({Key key}) : super(key: key);
  @override
  _PatientListTableState createState() => _PatientListTableState();
}

class _PatientListTableState extends State<PatientListTable> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  String hn = '';
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
                                  hn = val;
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
                flex: 1,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        // Access the fields as defined in FireStore
                        title: Text(
                          user.get('hn'),
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
                        // Access the fields as defined in FireStore
                        title: Text(
                          '${user.get('name')} ${user.get('surname')}',
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
                child: Column(
                  children: <Widget>[
                    FutureBuilder<Map<String, dynamic>>(
                        future: _firebaseService.getLatestAnSubCollection(
                            docId: user.id),
                        builder: (context, anSnapshot) {
                          if (!anSnapshot.hasData) {
                            return Text(
                              'loading...',
                              textAlign: TextAlign.center,
                            );
                          }
                          return ListTile(
                            title: anSnapshot.data['state'] != null
                                ? Text(
                                    anSnapshot.data['state'],
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  )
                                : Text(
                                    '-',
                                    textAlign: TextAlign.center,
                                  ),
                          );
                        }),
                  ],
                ),
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
                        arguments: user.get('hn'));
                  },
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
