import 'package:flutter/material.dart';
import 'package:AbdoCare_Web/Widget/sidebar.dart';

import '../Widget/postHomeTable.dart';
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
