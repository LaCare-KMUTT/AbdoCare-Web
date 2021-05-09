import 'package:AbdoCare_Web/Widget/shared/progress_bar.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ADLChart extends StatefulWidget {
  final String hn;
  ADLChart({Key key, this.hn}) : super(key: key);
  @override
  _ADLChartState createState() => _ADLChartState();
}

class _ADLChartState extends State<ADLChart> {
  final _firebaseService = locator<IFirebaseService>();
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

  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: _firebaseService.getAdlTable(hn: widget.hn),
        builder: (context, snap) {
          if (!snap.hasData) {
            return ProgressBar.circularProgressIndicator(context);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Row(
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Row(
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
                      child: adlRadialGaugeCriteria(context, topic = "Feeding",
                          score = snap.data['PreOpFeeding']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Feeding",
                          score = snap.data['PostHosFeeding']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Feeding",
                          score = snap.data['PostHomeFeeding']),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Row(
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
                            context,
                            topic = "Grooming",
                            score = snap.data['PreOpGrooming'])),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Grooming",
                          score = snap.data['PostHosGrooming']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Grooming",
                          score = snap.data['PostHomeGrooming']),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Row(
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
                      child: adlRadialGaugeCriteria(context, topic = "Transfer",
                          score = snap.data['PreOpTransfer']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Transfer",
                          score = snap.data['PostHosTransfer']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Transfer",
                          score = snap.data['PostHomeTransfer']),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Row(
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
                      child: adlRadialGaugeCriteria(context, topic = "Toilet",
                          score = snap.data['PreOpToilet']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Toilet",
                          score = snap.data['PostHosToilet']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Toilet",
                          score = snap.data['PostHomeToilet']),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Row(
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
                      child: adlRadialGaugeCriteria(context, topic = "Dressing",
                          score = snap.data['PreOpDressing']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Dressing",
                          score = snap.data['PostHosDressing']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Dressing",
                          score = snap.data['PostHomeDressing']),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Row(
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
                      child: adlRadialGaugeCriteria(context, topic = "Mobility",
                          score = snap.data['PreOpMobility']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Mobility",
                          score = snap.data['PostHospMobility']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Mobility",
                          score = snap.data['PostHomeMobility']),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Row(
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
                      child: adlRadialGaugeCriteria(context, topic = "Stairs",
                          score = snap.data['PreOpStairs']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Stairs",
                          score = snap.data['PostHosStairs']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Stairs",
                          score = snap.data['PostHomeStairs']),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Row(
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
                      child: adlRadialGaugeCriteria(context, topic = "Bathing",
                          score = snap.data['PreOpBathing']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Bathing",
                          score = snap.data['PostHosBathing']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Bathing",
                          score = snap.data['PostHomeBathing']),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Row(
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
                      child: adlRadialGaugeCriteria(context, topic = "Bowels",
                          score = snap.data['PreOpBowels']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Bowels",
                          score = snap.data['PostHosBowels']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Bowels",
                          score = snap.data['PostHomeBowels']),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Row(
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
                      child: adlRadialGaugeCriteria(context, topic = "Bladder",
                          score = snap.data['PreOpBladder']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Bladder",
                          score = snap.data['PostHosBladder']),
                    ),
                    Expanded(
                      child: adlRadialGaugeCriteria(context, topic = "Bladder",
                          score = snap.data['PostHomeBladder']),
                    ),
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
                child: Row(
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
                            child: Text('${snap.data['PreOpTotal']}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFFC37447))))),
                    Expanded(
                        child: Container(
                            child: Text('${snap.data['PostHosTotal']}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFFC37447))))),
                    Expanded(
                        child: Container(
                            child: Text('${snap.data['PostHomeTotal']}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFFC37447))))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'การแปลผล',
                      style: TextStyle(color: Color(0xFFC37447)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '12 คะแนนขึ้นไป = mild independence',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '9-11 คะแนน = moderately independence',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '5-8 คะแนน = severe independence',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '0-4 คะแนน = total independence',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
