import 'package:flutter/material.dart';

import '../Widget/post_operation_home/postHomeTable.dart';
import '../Widget/sidebar.dart';

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
      appBar: AppBar(
        title: const Text('Post-op @ Home'),
        backgroundColor: Color(0xFFC37447),
      ),
      body: PostHomeTable(),
      drawer: SideBar(),
    );
  }
}
