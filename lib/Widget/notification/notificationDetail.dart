import 'package:AbdoCare_Web/Widget/shared/progress_bar.dart';
import 'package:AbdoCare_Web/models/notification_list/all_notification_model.dart';
import 'package:AbdoCare_Web/models/notification_list/post_home_notification_model.dart';
import 'package:AbdoCare_Web/models/notification_list/post_hos_notification_model.dart';
import 'package:AbdoCare_Web/models/notification_list/pre_op_notification_model.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/notification_list/all_notification_view_model.dart';
import 'package:AbdoCare_Web/view_models/notification_list/post_hos_notification_view_model.dart';
import 'package:AbdoCare_Web/view_models/notification_list/post_home_notification_view_model.dart';
import 'package:AbdoCare_Web/view_models/notification_list/pre_op_notification_view_model.dart';
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
  final PreOpNotiViewModel _preOpNotiViewModel = locator<PreOpNotiViewModel>();
  final PostHosNotiViewModel _postHosNotiViewModel =
      locator<PostHosNotiViewModel>();
  final PostHomeNotiViewModel _postHomeNotiViewModel =
      locator<PostHomeNotiViewModel>();
  final AllNotiViewModel _allNotiViewModel = locator<AllNotiViewModel>();
  bool pressAllState = true;
  bool pressPreOpState = false;
  bool pressPostOpHospitalState = false;
  bool pressPostOpHomeState = false;
  Future<List<PostHosNotiData>> _postHosData;
  Future<List<PreOpNotiData>> _preOpData;
  Future<List<AllNotiData>> _allData;
  Future<List<PostHomeNotiData>> _postHomeData;
  List<PreOpNotiData> preOpData = [];
  List<PostHosNotiData> postHosData = [];
  List<PostHomeNotiData> postHomeData = [];
  List<AllNotiData> allData = [];
  String onClickState = "AllState";
  void callData(String patientState) {
    if (patientState == "Pre-Operation") {
      setState(() {
        _preOpData = _preOpNotiViewModel.getUsers();
      });
    } else if (patientState == "Post-Operation@Hospital") {
      setState(() {
        _postHosData = _postHosNotiViewModel.getUsers();
      });
    } else if (patientState == "Post-Operation@Home") {
      setState(() {
        _postHomeData = _postHomeNotiViewModel.getUsers();
      });
    } else {
      setState(() {
        _allData = _allNotiViewModel.getUsers();
      });
    }
  }

  @override
  void initState() {
    setState(() {
      _allData = _allNotiViewModel.getUsers();
      _preOpData = _preOpNotiViewModel.getUsers();
      _postHosData = _postHosNotiViewModel.getUsers();
      _postHomeData = _postHomeNotiViewModel.getUsers();
    });
    super.initState();
  }

  FutureBuilder notificationDataBody(String onClickState) {
    if (onClickState == "AllState") {
      return FutureBuilder<List<AllNotiData>>(
          future: _allData,
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ProgressBar.circularProgressIndicator(context));
            } else {
              if (allData.isNotEmpty) {
                allData.clear();
              }
              allData.addAll(snapshot.data);
              return AllNotificationTable(
                  allData: allData,
                  callAllData: callData,
                  patientState: onClickState);
            }
          });
    } else if (onClickState == "Pre-Operation") {
      return FutureBuilder<List<PreOpNotiData>>(
          future: _preOpData,
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ProgressBar.circularProgressIndicator(context));
            } else {
              if (preOpData.isNotEmpty) {
                preOpData.clear();
              }
              preOpData.addAll(snapshot.data);
              return PreNotificationTable(
                  preOpData: preOpData,
                  callPreOpData: callData,
                  patientState: onClickState);
            }
          });
    } else if (onClickState == "Post-Operation@Hospital") {
      return FutureBuilder<List<PostHosNotiData>>(
          future: _postHosData,
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ProgressBar.circularProgressIndicator(context));
            } else {
              if (postHosData.isNotEmpty) {
                postHosData.clear();
              }
              postHosData.addAll(snapshot.data);
              return PostHosNotificationTable(
                  postHosData: postHosData,
                  callPostHosData: callData,
                  patientState: onClickState);
            }
          });
    } else if (onClickState == "Post-Operation@Home") {
      return FutureBuilder<List<PostHomeNotiData>>(
          future: _postHomeData,
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ProgressBar.circularProgressIndicator(context));
            } else {
              if (postHomeData.isNotEmpty) {
                postHomeData.clear();
              }
              postHomeData.addAll(snapshot.data);
              return PostHomeNotificationTable(
                  postHomeData: postHomeData,
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
                padding: EdgeInsets.fromLTRB(screenSize.height / 15,
                    screenSize.height / 20, screenSize.height / 15, 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 40, 0,
                            screenSize.height / 40, 0),
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
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 40, 0,
                            screenSize.height / 40, 0),
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
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 40, 0,
                            screenSize.height / 40, 0),
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
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 40, 0,
                            screenSize.height / 40, 0),
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
