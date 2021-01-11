import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../Widget/dashboard/dashboardDetail.dart';
import '../Widget/sidebar.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('สรุปผลประจำวัน'),
        appBar: AppBar(),
      ),
      body: DashboardDetail(),
      drawer: SideBar(),
    );
  }
}
