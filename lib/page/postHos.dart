import 'package:flutter/material.dart';
import 'package:AbdoCare_Web/Widget/sidebar.dart';

import '../Widget/postHosTable.dart';
import '../Widget/sidebar.dart';
import '../Widget/appbar.dart';

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
      appBar: BaseAppBar(
        title: Text('Post-Operation @ Hospital'),
        appBar: AppBar(),
      ),
      body: PostHosTable(),
      drawer: SideBar(),
    );
  }
}
