import 'package:flutter/material.dart';

import 'notification_Table.dart';

class NotificationDetail extends StatefulWidget {
  NotificationDetail({Key key}) : super(key: key);
  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(screenSize.height / 15,
                    screenSize.height / 20, screenSize.height / 15, 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 20, 0,
                            screenSize.height / 20, 0),
                        child: RaisedButton(
                            child:
                                Text("ทั้งหมด", style: TextStyle(fontSize: 18)),
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            onPressed: () {
                              setState(() {});
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 20, 0,
                            screenSize.height / 20, 0),
                        child: RaisedButton(
                            child: Text("Pre-Operation",
                                style: TextStyle(fontSize: 18)),
                            padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            onPressed: () {}),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 20, 0,
                            screenSize.height / 20, 0),
                        child: RaisedButton(
                            child: Text("Post-Operation@Hospital",
                                style: TextStyle(fontSize: 18)),
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            onPressed: () {}),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 20, 0,
                            screenSize.height / 20, 0),
                        child: RaisedButton(
                            child: Text("Post-Operation@Home",
                                style: TextStyle(fontSize: 18)),
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            onPressed: () {}),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Container(child: NotificationTable()),
          ],
        ),
      ),
    );
  }
}
