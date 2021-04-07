import 'package:flutter/material.dart';
import 'ADL_chart.dart';
import 'dashboard_Table.dart';
import 'radial_gauge_chart .dart';

class ShowDashboard extends StatefulWidget {
  final String patientstate;
  ShowDashboard({Key key, this.patientstate}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ShowDashboardState();
}

class _ShowDashboardState extends State<ShowDashboard> {
  Widget _preopdashboard(BuildContext context) {
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
                      child: Text('พัฒนาการในแต่ละหัวข้อ',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: ADLChart(),
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
                      child: Text(
                        'ผลการประเมินการปฏิบัติกิจวัตรประจำวัน',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFC37447)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: PieChart(),
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

  Widget _postopHospitaldashboard(BuildContext context) {
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
                      child: Text('ข้อมูลจากแบบฟรอมการประเมิน',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: DashboardTable(),
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
                      child: Text('พัฒนาการในแต่ละหัวข้อ',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: ADLChart(),
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
                      child: Text(
                        'ผลการประเมินการปฏิบัติกิจวัตรประจำวัน',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFC37447)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: PieChart(),
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

  Widget _postopHomedashboard(BuildContext context) {
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
                      child: Text('พัฒนาการในแต่ละหัวข้อ',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: ADLChart(),
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
                      child: Text(
                        'ผลการประเมินการปฏิบัติกิจวัตรประจำวัน',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFC37447)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: PieChart(),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (() {
        switch (widget.patientstate) {
          case "Pre-Operation":
            return _preopdashboard(context);
            break;
          case "Post-Operation@Hospital":
            return _postopHospitaldashboard(context);
            break;
          case "Post-Operation@Home":
            return _postopHomedashboard(context);
            break;
        }
      }()),
    );
  }
}
