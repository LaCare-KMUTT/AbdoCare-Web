import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ADLChart extends StatefulWidget {
  @override
  _ADLChartState createState() => _ADLChartState();
}

class _ADLChartState extends State<ADLChart> {
  double score;
  String topic;

  Widget adlRadialGaugeCriteria(
      BuildContext context, String topic, double score) {
    Widget child;
    // For 2 choice
    if (topic == "Grooming" || topic == "Bathing") {
      if (score == 0) {
        child = adlRadialGauge(0);
      } else if (score == 1) {
        child = adlRadialGauge(100);
      } else {
        child = adlRadialGauge(0);
      }
    } // For 3 choice
    else if (topic == "Feeding" ||
        topic == "Toilet" ||
        topic == "Dressing" ||
        topic == "Stairs" ||
        topic == "Bowels" ||
        topic == "Bladder") {
      if (score == 0) {
        child = adlRadialGauge(0);
      } else if (score == 1) {
        child = adlRadialGauge(50);
      } else if (score == 2) {
        child = adlRadialGauge(100);
      } else {
        child = adlRadialGauge(0);
      }
    }
    // For 4 choice
    else if (topic == "Transfer" || topic == "Mobility") {
      if (score == 0) {
        child = adlRadialGauge(0);
      } else if (score == 1) {
        child = adlRadialGauge(33);
      } else if (score == 2) {
        child = adlRadialGauge(66);
      } else if (score == 3) {
        child = adlRadialGauge(100);
      } else {
        child = adlRadialGauge(0);
      }
    }
    return Container(child: child);
  }

  Widget adlRadialGauge(double result) {
    return Container(
      height: 100,
      width: 10,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
              axisLineStyle: AxisLineStyle(
                thickness: 20,
              ),
              startAngle: -90,
              endAngle: 270,
              showTicks: false,
              showLabels: false,
              pointers: <GaugePointer>[
                RangePointer(value: result, width: 20, color: Color(0xFFC37447))
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child:
                            Text('$result %', style: TextStyle(fontSize: 16))),
                    angle: 90,
                    positionFactor: 0.2)
              ]),
        ],
      ),
    );
  }

  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                    ),
                    Expanded(
                        child: Container(
                            child: Text('Pre-Operation',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2))),
                    Expanded(
                        child: Container(
                            child: Text('Post-Operation@Hospital',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2))),
                    Expanded(
                        child: Container(
                            child: Text('Post-Operation@Home',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2))),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การรับประทานอาหาร',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Feeding", score = 2),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Feeding", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Feeding", score = 0),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                            'ล้างหน้า หวีผม แปรงฟัน โกนหนวด ในระยะเวลา 24 - 28 ชั่วโมงที่ผ่านมา',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                        child: adlRadialGaugeCriteria(
                            context, topic = "Grooming", score = 1)),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Grooming", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Grooming", score = 0),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การลุกจากที่นอน',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Transfer", score = 3),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Transfer", score = 2),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Transfer", score = 0),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การใช้ห้องน้ำ',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Toilet", score = 2),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Toilet", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Toilet", score = 0),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การสวมใส่เสื้อผ้า',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Dressing", score = 2),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Dressing", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Dressing", score = 0),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การเคลื่อนที่ภายในห้องหรือบ้าน',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Mobility", score = 2),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Mobility", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Mobility", score = 0),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การขึ้นลงบันได 1 ชั้น',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Stairs", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Stairs", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Stairs", score = 0),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การอาบน้ำ',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Bathing", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Bathing", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Bathing", score = 0),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การกลั้นปัสสาวะในระยะ 1 สัปดาห์ที่ผ่านมา',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Bowels", score = 2),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Bowels", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Bowels", score = 0),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การกลั้นอุจจาระในระยะ 1 สัปดาห์ที่ผ่านมา',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Bladder", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Bladder", score = 1),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(
                          context, topic = "Bladder", score = 0),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Color(0xFFC37447),
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('ผลรวม',
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFFC37447)),
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                        child: Container(
                            child: Text('16',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFFC37447))))),
                    Expanded(
                        child: Container(
                            child: Text('12',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFFC37447))))),
                    Expanded(
                        child: Container(
                            child: Text('0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFFC37447))))),
                  ],
                )
              ],
            ),
          ),
        ],
      );
}
