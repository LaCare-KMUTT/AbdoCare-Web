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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbdoCare'),
        backgroundColor: Color(0xFFC37447),
      ),
      body: PatientRegisterForm(),
      drawer: SideBar(),
    );
  }
}
