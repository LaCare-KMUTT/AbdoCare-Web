import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../Widget/dashboard/pre_operation/preDashboardDetail.dart';
import '../Widget/sidebar.dart';

class PreDashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PreDashboardPageState();
  }
}

class _PreDashboardPageState extends State<PreDashboardPage> {
  @override
  Widget build(BuildContext context) {
    final hn = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: BaseAppBar(
        title: Text('สรุปผลประจำวัน'),
        appBar: AppBar(),
      ),
      body: PreDashboardDetail(
        hn: hn,
      ),
      drawer: SideBar(),
    );
  }
}
