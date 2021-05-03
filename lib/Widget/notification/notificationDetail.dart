import 'package:AbdoCare_Web/models/notification_list/notification_model.dart';
import 'package:AbdoCare_Web/Widget/shared/progress_bar.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/notification_list/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'postHome_Notification_Table.dart';
import 'postHos_Notification_Table.dart';
import 'pre_Notification_Table.dart';
import 'all_Notification_Table.dart';

class NotificationDetail extends StatefulWidget {
  NotificationDetail({Key key}) : super(key: key);
  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  final NotiViewModel _notiViewModel = locator<NotiViewModel>();
  bool pressAllState = true;
  bool pressPreOpState = false;
  bool pressPostOpHospitalState = false;
  bool pressPostOpHomeState = false;
  Future<List<NotiData>> _notidata;
  List<NotiData> notidata = [];
  String onClickState = "AllState";
  void callData(String patientState) {
    setState(() {
      _notidata = _notiViewModel.getUsers(patientState);
    });
  }

  @override
  void initState() {
    setState(() {
      _notidata = _notiViewModel.getUsers("AllState");
    });
    super.initState();
  }

  FutureBuilder notificationDataBody(String onClickState) {
    if (onClickState == "AllState") {
      return FutureBuilder<List<NotiData>>(
          future: _notidata,
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ProgressBar.circularProgressIndicator(context));
            } else {
              if (notidata.isNotEmpty) {
                notidata.clear();
              }
              notidata.addAll(snapshot.data);
              return AllNotificationTable(
                  notiData: notidata,
                  callAllData: callData,
                  patientState: onClickState);
            }
          });
    } else if (onClickState == "Pre-Operation") {
      return FutureBuilder<List<NotiData>>(
          future: _notidata,
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ProgressBar.circularProgressIndicator(context));
            } else {
              if (notidata.isNotEmpty) {
                notidata.clear();
              }
              notidata.addAll(snapshot.data);
              return PreNotificationTable(
                  preOpData: notidata,
                  callPreOpData: callData,
                  patientState: onClickState);
            }
          });
    } else if (onClickState == "Post-Operation@Hospital") {
      return FutureBuilder<List<NotiData>>(
          future: _notidata,
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ProgressBar.circularProgressIndicator(context));
            } else {
              if (notidata.isNotEmpty) {
                notidata.clear();
              }
              notidata.addAll(snapshot.data);
              return PostHosNotificationTable(
                  postHosData: notidata,
                  callPostHosData: callData,
                  patientState: onClickState);
            }
          });
    } else if (onClickState == "Post-Operation@Home") {
      return FutureBuilder<List<NotiData>>(
          future: _notidata,
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ProgressBar.circularProgressIndicator(context));
            } else {
              if (notidata.isNotEmpty) {
                notidata.clear();
              }
              notidata.addAll(snapshot.data);
              return PostHomeNotificationTable(
                  postHomeData: notidata,
                  callPostHomeData: callData,
                  patientState: onClickState);
            }
          });
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(screenSize.height / 25,
                    screenSize.height / 20, screenSize.height / 25, 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            5, 0, screenSize.height / 50, 0),
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
                                pressAllState = true;
                                pressPreOpState = false;
                                pressPostOpHospitalState = false;
                                pressPostOpHomeState = false;
                                onClickState = "AllState";
                                callData(onClickState);
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 50, 0,
                            screenSize.height / 50, 0),
                        child: RaisedButton(
                            child: Text(
                              "Pre-Operation",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: pressPreOpState
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            color: pressPreOpState
                                ? Color(0xFFC37447)
                                : Colors.grey[300],
                            onPressed: () {
                              setState(() {
                                pressPreOpState = true;
                                pressAllState = false;
                                pressPostOpHospitalState = false;
                                pressPostOpHomeState = false;
                                onClickState = "Pre-Operation";
                                callData(onClickState);
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 50, 0,
                            screenSize.height / 50, 0),
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
                                pressPostOpHospitalState = true;
                                pressAllState = false;
                                pressPreOpState = false;
                                pressPostOpHomeState = false;
                                onClickState = "Post-Operation@Hospital";
                                callData(onClickState);
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenSize.height / 50, 0, 5, 0),
                        child: RaisedButton(
                            child: Text("Post-Operation@Home",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: pressPostOpHomeState
                                        ? Colors.white
                                        : Colors.black)),
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            color: pressPostOpHomeState
                                ? Color(0xFFC37447)
                                : Colors.grey[300],
                            onPressed: () {
                              setState(() {
                                pressPostOpHomeState = true;
                                pressAllState = false;
                                pressPreOpState = false;
                                pressPostOpHospitalState = false;
                                onClickState = "Post-Operation@Home";
                                callData(onClickState);
                              });
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.fromLTRB(screenSize.height / 25,
                  screenSize.height / 50, screenSize.height / 25, 0),
              child: Card(
                child: Container(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FittedBox(
                              child: notificationDataBody(onClickState)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
