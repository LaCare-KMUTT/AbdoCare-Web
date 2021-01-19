import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../Widget/sidebar.dart';
import '../Widget/dashboard/postHosDashboardDetail.dart';

class PostHosDashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostHosDashboardPageState();
  }
}

class _PostHosDashboardPageState extends State<PostHosDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('สรุปผลประจำวัน'),
        appBar: AppBar(),
      ),
      body: PostHosDashboardDetail(),
      drawer: SideBar(),
    );
  }
}
