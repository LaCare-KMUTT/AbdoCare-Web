import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../Widget/sidebar.dart';
import '../Widget/dashboard/preDashboardDetail.dart';

class PreDashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PreDashboardPageState();
  }
}

class _PreDashboardPageState extends State<PreDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('สรุปผลประจำวัน'),
        appBar: AppBar(),
      ),
      body: PreDashboardDetail(),
      drawer: SideBar(),
    );
  }
}
