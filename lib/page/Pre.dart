import 'package:flutter/material.dart';

import 'package:AbdoCare_Web/Widget/sidebar.dart';

import '../Widget/preTable.dart';
import '../Widget/sidebar.dart';

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
      appBar: AppBar(
        title: const Text('Pre-op'),
        backgroundColor: Color(0xFFC37447),
      ),
      body: PreTable(),
      drawer: SideBar(),
    );
  }
}
