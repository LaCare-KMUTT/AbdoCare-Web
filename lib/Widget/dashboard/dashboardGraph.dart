import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'ADL_chart.dart';
import 'barchart.dart';
import 'dashboard_Table.dart';
import 'radial_gauge_chart .dart';
import 'test.dart';

class ShowDashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShowDashboardState();
}

class _ShowDashboardState extends State<ShowDashboard> {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      topic: "การรับประทานอาหาร",
      point: 3,
      barColor: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
    SubscriberSeries(
      topic: "การขึ้นลงบันได1ชั้น",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    SubscriberSeries(
      topic: "การสวมใส่เสื้อผ้า",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    SubscriberSeries(
      topic: "การลุกจากที่นอน",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    SubscriberSeries(
      topic: "การเคลื่อนที่ภายในห้องหรือบ้าน\n",
      point: 2,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    SubscriberSeries(
      topic: "การอาบน้ำ",
      point: 0,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    SubscriberSeries(
      topic: "การใช้ห้องน้ำ",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    SubscriberSeries(
      topic: "การกลั้นอุจจาระในระยะ\n1 สัปดาห์ที่ผ่านมา\n",
      point: 3,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    SubscriberSeries(
      topic: "การกลั้นปัสสาวะในระยะ\n1 สัปดาห์ที่ผ่านมา\n",
      point: 2,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    SubscriberSeries(
      topic: "การล้างหน้า หวีผม แปรงฟัน",
      point: 3,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
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
                      child: Text('Test',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            child: IconButton(
                              icon: Icon(
                                Icons.chevron_left,
                                size: 50,
                              ),
                              color: Color(0xFFC37447),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(child: TestChart()),
                          Container(
                            width: 50,
                            child: IconButton(
                              icon: Icon(
                                Icons.chevron_right,
                                size: 50,
                              ),
                              color: Color(0xFFC37447),
                              onPressed: () {},
                            ),
                          ),
                        ],
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
}
