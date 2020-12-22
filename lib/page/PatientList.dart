import 'package:flutter/material.dart';
import 'package:AbdoCare_Web/Widget/sidebar.dart';

import '../Widget/PatientListTable.dart';
import '../Widget/sidebar.dart';

class PatientListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PatientListPageState();
  }
}

class _PatientListPageState extends State<PatientListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายชื่อผู้ป่วย'),
        backgroundColor: Color(0xFFC37447),
      ),
      body: PatientListTable(),
      drawer: SideBar(),
    );
  }
}
