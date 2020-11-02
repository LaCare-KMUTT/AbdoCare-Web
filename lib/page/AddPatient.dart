import 'package:AbdoCare_Web/Widget/sidebar.dart';
import 'package:flutter/material.dart';

import '../Widget/patientRegisterForm.dart';
import '../Widget/sidebar.dart';

class AddPatientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPatientPageState();
  }
}

class _AddPatientPageState extends State<AddPatientPage> {
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
  }) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('AbdoCare'),
        title: const Text('เพิ่มผู้ป่วย'),
        backgroundColor: Color(0xFFC37447),
      ),
      body: PatientRegisterForm(
        _submitPatientRegisterForm,
      ),
      drawer: SideBar(),
    );
  }
}
