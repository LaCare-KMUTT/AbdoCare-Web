import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../Widget/sidebar.dart';
import '../Widget/notification/notificationDetail.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationPageState();
  }
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('การแจ้งเตือน'),
        appBar: AppBar(),
      ),
      body: NotificationDetail(),
      drawer: SideBar(),
    );
  }
}
