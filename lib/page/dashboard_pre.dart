import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../Widget/dashboard/pre_operation/preDashboardDetail.dart';
import '../Widget/sidebar.dart';

class PreDashboardPage extends StatefulWidget {
  final String hn;
  PreDashboardPage({Key key, @required this.hn}) : super(key: key);
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
      body: PreDashboardDetail(
        hn: widget.hn,
      ),
      drawer: SideBar(),
    );
  }
}
