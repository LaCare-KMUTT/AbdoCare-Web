import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'barchart.dart';
import 'linechart.dart';

class ShowDashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShowDashboardState();
}

class _ShowDashboardState extends State<ShowDashboard> {
  final List<PointSeries> data2 = [
    PointSeries(day: 0, point: 10),
    PointSeries(day: 1, point: 8),
    PointSeries(day: 2, point: 7),
    PointSeries(day: 3, point: 8),
    PointSeries(day: 4, point: 5),
    PointSeries(day: 5, point: 4),
    PointSeries(day: 6, point: 2),
  ];

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
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text('พัฒนาการในแต่ละหัวข้อ',
                          style: TextStyle(color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: BarChart(data: data),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text('ความเจ็บปวด',
                          style: TextStyle(color: Color(0xFFC37447))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: LineChart(data2: data2),
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
