import 'package:flutter/material.dart';

import '../Widget/post_opeation_hospital/postHosTable.dart';
import '../Widget/sidebar.dart';

class PostHosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostHosPageState();
  }
}

class _PostHosPageState extends State<PostHosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post-op @ Hospital'),
        backgroundColor: Color(0xFFC37447),
      ),
      body: PostHosTable(),
      drawer: SideBar(),
    );
  }
}
