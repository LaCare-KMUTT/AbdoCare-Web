import 'package:AbdoCare_Web/Widget/sidebar.dart';
import 'package:flutter/material.dart';

import '../Widget/pre_operation/preTable.dart';
import '../Widget/sidebar.dart';
import '../Widget/appbar.dart';

class PrePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PrePageState();
  }
}

class _PrePageState extends State<PrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Pre-Operation'),
        appBar: AppBar(),
      ),
      body: PreTable(),
      drawer: SideBar(),
    );
  }
}
