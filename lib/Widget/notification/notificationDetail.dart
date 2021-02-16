import 'package:flutter/material.dart';

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
                            onPressed: () {}),
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
                            padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            onPressed: () {}),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(screenSize.height / 15,
                        screenSize.height / 70, screenSize.height / 15, 0),
                    child: Card(
                        child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "ยังไม่อ่าน",
                                  style: TextStyle(color: Color(0xFFC37447)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(screenSize.height / 20,
                              8, screenSize.height / 20, 0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "นางสาวพรพิมล แก้วใส",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Post-op@Hospital",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "ไม่ผ่านแบบประเมินระบบปัสสาวะ",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "ห้อง3 เตียง2",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "16:29",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                  child: Text(
                                "อ่านแล้ว",
                                style: TextStyle(color: Color(0xFFC37447)),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(screenSize.height / 20,
                              8, screenSize.height / 20, 8),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "นางสาวพรพิมล แก้วใส",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Post-op@Hospital",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "ไม่ผ่านแบบประเมินระบบปัสสาวะ",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "ห้อง3 เตียง2",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "16:29",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
