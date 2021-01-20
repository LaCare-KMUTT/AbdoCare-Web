import 'package:flutter/material.dart';

import '../Widget/post_operation_home/postHomeTable.dart';
import '../Widget/sidebar.dart';
import '../Widget/appbar.dart';

class PostHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostHomePageState();
  }
}

class _PostHomePageState extends State<PostHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Post-op @ Home'),
        appBar: AppBar(),
      ),
      body: PostHomeTable(),
      drawer: SideBar(),
    );
  }
}
