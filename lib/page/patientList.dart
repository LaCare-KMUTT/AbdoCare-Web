import 'package:flutter/material.dart';
import 'package:AbdoCare_Web/Widget/sidebar.dart';

import '../Widget/patientListTable.dart';
import '../Widget/sidebar.dart';
import '../Widget/appbar.dart';

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
      appBar: BaseAppBar(
        title: Text('รายชื่อผู้ป่วย'),
        appBar: AppBar(),
      ),
      body: PatientListTable(),
      drawer: SideBar(),
    );
  }
}
