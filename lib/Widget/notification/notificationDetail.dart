import 'package:flutter/material.dart';

import 'notification_Table.dart';

class NotificationDetail extends StatefulWidget {
  NotificationDetail({Key key}) : super(key: key);
  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  bool pressAllState = false;
  bool pressPreOpState = false;
  bool pressPostOpHospitalState = true;
  bool pressPostOpHomeState = false;

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
                            child: Text("ทั้งหมด",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: pressAllState
                                        ? Colors.white
                                        : Colors.black)),
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            color: pressAllState
                                ? Color(0xFFC37447)
                                : Colors.grey[300],
                            onPressed: () {
                              setState(() {
                                pressAllState = !pressAllState;
                                pressPreOpState = false;
                                pressPostOpHospitalState = false;
                                pressPostOpHomeState = false;
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 20, 0,
                            screenSize.height / 20, 0),
                        child: RaisedButton(
                            child: Text(
                              "Pre-Operation",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: pressPreOpState
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            color: pressPreOpState
                                ? Color(0xFFC37447)
                                : Colors.grey[300],
                            onPressed: () {
                              setState(() {
                                pressPreOpState = !pressPreOpState;
                                pressAllState = false;
                                pressPostOpHospitalState = false;
                                pressPostOpHomeState = false;
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 20, 0,
                            screenSize.height / 20, 0),
                        child: RaisedButton(
                            child: Text("Post-Operation@Hospital",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: pressPostOpHospitalState
                                        ? Colors.white
                                        : Colors.black)),
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            color: pressPostOpHospitalState
                                ? Color(0xFFC37447)
                                : Colors.grey[300],
                            onPressed: () {
                              setState(() {
                                pressPostOpHospitalState =
                                    !pressPostOpHospitalState;
                                pressAllState = false;
                                pressPreOpState = false;
                                pressPostOpHomeState = false;
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 20, 0,
                            screenSize.height / 20, 0),
                        child: RaisedButton(
                            child: Text("Post-Operation@Home",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: pressPostOpHomeState
                                        ? Colors.white
                                        : Colors.black)),
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            color: pressPostOpHomeState
                                ? Color(0xFFC37447)
                                : Colors.grey[300],
                            onPressed: () {
                              setState(() {
                                pressPostOpHomeState = !pressPostOpHomeState;
                                pressAllState = false;
                                pressPreOpState = false;
                                pressPostOpHospitalState = false;
                              });
                            }),
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
