import 'package:flutter/material.dart';
import 'package:AbdoCare_Web/Widget/sidebar.dart';

import '../Widget/postHosTable.dart';
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
        title: const Text('AbdoCare'),
        backgroundColor: Color(0xFFC37447),
      ),
      body: PostHosTable(),
      // body: Padding(
      //   padding: const EdgeInsets.only(top: 16),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         'Post-op @ Hospital',
      //         style: TextStyle(fontSize: 18),
      //       )
      //     ],
      //   ),
      // ),
      drawer: SideBar(),
    );
  }
}
