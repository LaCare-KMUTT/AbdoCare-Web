import 'package:flutter/material.dart';

class PostHosTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostHosTableState();
  }
}

class _PostHosTableState extends State<PostHosTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Center(
            // child: Text(
            //   'Post-op @ Hospital',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            // ),
            ),
      ]),
    );
  }
}
