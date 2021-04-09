import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../Widget/sidebar.dart';
import '../Widget/dashboard/post_operation_hospital/postHosDashboardDetail.dart';

class PostHosDashboardPage extends StatefulWidget {
  final String hn;
  PostHosDashboardPage({Key key, @required this.hn}) : super(key: key);
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
      body: PostHosDashboardDetail(hn: widget.hn),
      drawer: SideBar(),
    );
  }
}
