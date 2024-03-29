import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../Widget/sidebar.dart';
import '../Widget/dashboard/post_operation_home/postHomeDashboardDetail.dart';

class PostHomeDashboardPage extends StatefulWidget {
  final String hn;
  PostHomeDashboardPage({Key key, @required this.hn}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PostHomeDashboardPageState();
  }
}

class _PostHomeDashboardPageState extends State<PostHomeDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('สรุปผลประจำวัน'),
        appBar: AppBar(),
      ),
      body: PostHomeDashboardDetail(hn: widget.hn),
      drawer: SideBar(),
    );
  }
}
