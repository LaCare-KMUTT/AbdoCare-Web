import 'package:AbdoCare_Web/Widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Widget/patientRegisterForm.dart';
import '../Widget/sidebar.dart';
import '../Widget/appbar.dart';

class AddPatientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPatientPageState();
  }
}

class _AddPatientPageState extends State<AddPatientPage> {
  // final _auth = FirebaseAuth.instance;

  void _submitPatientRegisterForm({
    @required String patientName,
    @required String address,
    @required String gender,
    @required String dob,
    @required double weight,
    @required double height,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required String username,
    @required String uniqueKey,
    @required String password,
  }) async {
    FirebaseApp tempApp = await Firebase.initializeApp(
        name: 'Temporary Register', options: Firebase.app().options);

    UserCredential authResult = await FirebaseAuth.instanceFor(app: tempApp)
        .createUserWithEmailAndPassword(email: username, password: uniqueKey);
    FirebaseFirestore.instance
        .collection('Users')
        .doc(authResult.user.uid)
        .set({
      'name': patientName,
      'address': address,
      'gender': gender,
      'dob': dob,
      'weight': weight,
      'height': height,
      'patientTel': patientTel,
      'careTakerName': careTakerName,
      'careTakerTel': careTakerTel,
      'careTakerRelationship': careTakerRelationship,
      'username': username,
      'uniqueKey': uniqueKey,
      'password': password,
      'role': 'patient',
    });

    tempApp.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('เพิ่มผู้ป่วย'),
        appBar: AppBar(),
      ),
      body: PatientRegisterForm(
        _submitPatientRegisterForm,
      ),
      drawer: SideBar(),
    );
  }
}
