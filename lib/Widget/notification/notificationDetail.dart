import 'package:AbdoCare_Web/models/notification_list/all_notification_model.dart';
import 'package:AbdoCare_Web/models/notification_list/post_home_notification_model.dart';
import 'package:AbdoCare_Web/models/notification_list/post_hos_notification_model.dart';
import 'package:AbdoCare_Web/models/notification_list/pre_op_notification_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/notification_list/all_notification_view_model.dart';
import 'package:AbdoCare_Web/view_models/notification_list/post-hos_notification_view_model.dart';
import 'package:AbdoCare_Web/view_models/notification_list/post_home_notification_view_model.dart';
import 'package:AbdoCare_Web/view_models/notification_list/pre_op_notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../material.dart';
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
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final PreOpNotiViewModel _preOpNotiViewModel = locator<PreOpNotiViewModel>();
  final PostHosNotiViewModel _postHosNotiViewModel =
      locator<PostHosNotiViewModel>();
  final PostHomeNotiViewModel _postHomeNotiViewModel =
      locator<PostHomeNotiViewModel>();
  final AllNotiViewModel _allNotiViewModel = locator<AllNotiViewModel>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();
  bool pressAllState = false;
  bool pressPreOpState = false;
  bool pressPostOpHospitalState = true;
  bool pressPostOpHomeState = false;
  String onClickState = "Post-Operation@Hospital";
  List<PreOpNotiData> preOpData = [];
  List<PostHosNotiData> postHosData = [];
  List<PostHomeNotiData> postHomeData = [];
  List<AllNotiData> allData = [];
  FutureBuilder notificationDataBody(String onClickState) {
    if (onClickState == "AllState") {
      return FutureBuilder<List<AllNotiData>>(
          future: _allNotiViewModel.getUsers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                ),
              );
            } else {
              if (allData.isNotEmpty) {
                allData.clear();
              }
              allData.addAll(snapshot.data);
              return AllNotificationTable();
            }
          });
    } else if (onClickState == "Pre-Operation") {
      return FutureBuilder<List<PreOpNotiData>>(
          future: _preOpNotiViewModel.getUsers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                ),
              );
            } else {
              if (preOpData.isNotEmpty) {
                preOpData.clear();
              }
              preOpData.addAll(snapshot.data);
              return PreNotificationTable();
            }
          });
    } else if (onClickState == "Post-Operation@Hospital") {
      return FutureBuilder<List<PostHosNotiData>>(
          future: _postHosNotiViewModel.getUsers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                ),
              );
            } else {
              if (postHosData.isNotEmpty) {
                postHosData.clear();
              }
              postHosData.addAll(snapshot.data);
              return PostHosNotificationTable();
            }
          });
    } else if (onClickState == "Post-Operation@Home") {
      return FutureBuilder<List<PostHomeNotiData>>(
          future: _postHomeNotiViewModel.getUsers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || onClickState == null) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                ),
              );
            } else {
              if (postHomeData.isNotEmpty) {
                postHomeData.clear();
              }
              postHomeData.addAll(snapshot.data);
              return PostHomeNotificationTable();
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
                                pressAllState = !pressAllState;
                                pressPreOpState = false;
                                pressPostOpHospitalState = false;
                                pressPostOpHomeState = false;
                                onClickState = "AllState";
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
                                pressPreOpState = !pressPreOpState;
                                pressAllState = false;
                                pressPostOpHospitalState = false;
                                pressPostOpHomeState = false;
                                onClickState = "Pre-Operation";
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
                                pressPostOpHospitalState =
                                    !pressPostOpHospitalState;
                                pressAllState = false;
                                pressPreOpState = false;
                                pressPostOpHomeState = false;
                                onClickState = "Post-Operation@Hospital";
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
                                pressPostOpHomeState = !pressPostOpHomeState;
                                pressAllState = false;
                                pressPreOpState = false;
                                pressPostOpHospitalState = false;
                                onClickState = "Post-Operation@Home";
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
