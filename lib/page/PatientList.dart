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
        centerTitle: true,
        title: const Text('รายชื่อผู้ป่วย'),
        backgroundColor: Color(0xFFC37447),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  Navigator.pushNamed(context, '/notification_page');
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.pushNamed(context, '/notification_page');
                }),
          ),
        ],
      ),
      body: PatientListTable(),
      drawer: SideBar(),
    );
  }
}
