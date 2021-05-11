import 'package:AbdoCare_Web/Widget/dashboard/pain_chart.dart';
import 'package:AbdoCare_Web/Widget/shared/progress_bar.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'ADL_chart.dart';
import 'dashboard_Table.dart';

class ShowDashboard extends StatefulWidget {
  final String patientstate;
  final String hn;
  ShowDashboard({Key key, this.patientstate, this.hn}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ShowDashboardState();
}

class _ShowDashboardState extends State<ShowDashboard> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  Widget _preOpDashboard(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text('ข้อมูลจากแบบฟอร์มการประเมิน',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: DashboardTable(
                        hn: widget.hn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text('ผลการประเมินการปฏิบัติกิจวัตรประจำวัน',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: ADLChart(hn: widget.hn),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _postOpHospitalDashboard(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text('ข้อมูลจากแบบฟอร์มการประเมิน',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: DashboardTable(
                        hn: widget.hn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text('ผลการประเมินการปฏิบัติกิจวัตรประจำวัน',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: ADLChart(hn: widget.hn),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _postOpHomeDashboard(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text('ผลการประเมินการปฏิบัติกิจวัตรประจำวัน',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: ADLChart(hn: widget.hn),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              child: Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Text('ความเจ็บปวด',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFFC37447))),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Container(
                        child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: _firebaseService.getVitalSignTable(
                                hn: widget.hn,
                                dashboardState: "Post-Operation@Home"),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child:
                                        ProgressBar.circularProgressIndicator(
                                            context));
                              }
                              if (snapshot.data.length == 0 ||
                                  snapshot.data == null) {
                                return Container(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Row(
                                    children: [
                                      Text(
                                          '''ไม่มีข้อมูลจากแบบฟอร์มความเจ็บปวด''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                    ],
                                  ),
                                );
                              }
                              return PainChart(snapshot: snapshot);
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (() {
        switch (widget.patientstate) {
          case "Pre-Operation":
            return _preOpDashboard(context);
            break;
          case "Post-Operation@Hospital":
            return _postOpHospitalDashboard(context);
            break;
          case "Post-Operation@Home":
            return _postOpHomeDashboard(context);
            break;
        }
      }()),
    );
  }
}
