import 'package:flutter/material.dart';

import '../Widget/appointmentListTable.dart';
import '../Widget/sidebar.dart';
import '../Widget/appbar.dart';

class AppointmentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppointmentPageState();
  }
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('ตารางนัด'),
        appBar: AppBar(),
      ),
      body: AppointmentListTable(),
      drawer: SideBar(),
    );
  }
}
