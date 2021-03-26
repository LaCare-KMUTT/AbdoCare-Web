import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ADLChart extends StatelessWidget {
  Widget adlradialGauge(double score) {
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
                RangePointer(value: score, width: 20, color: Color(0xFFC37447))
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child:
                            Text('$score %', style: TextStyle(fontSize: 16))),
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
                        child: Text('การรับประทานอาหาร',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: adlradialGauge(50),
                    ),
                    Expanded(
                      child: adlradialGauge(20),
                    ),
                    Expanded(
                      child: adlradialGauge(50),
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
                      child: adlradialGauge(80),
                    ),
                    Expanded(
                      child: adlradialGauge(50),
                    ),
                    Expanded(
                      child: adlradialGauge(70),
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
                      child: adlradialGauge(70),
                    ),
                    Expanded(
                      child: adlradialGauge(30),
                    ),
                    Expanded(
                      child: adlradialGauge(50),
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
                      child: adlradialGauge(90),
                    ),
                    Expanded(
                      child: adlradialGauge(50),
                    ),
                    Expanded(
                      child: adlradialGauge(80),
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
                      child: adlradialGauge(80),
                    ),
                    Expanded(
                      child: adlradialGauge(20),
                    ),
                    Expanded(
                      child: adlradialGauge(60),
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
                      child: adlradialGauge(60),
                    ),
                    Expanded(
                      child: adlradialGauge(20),
                    ),
                    Expanded(
                      child: adlradialGauge(60),
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
                      child: adlradialGauge(80),
                    ),
                    Expanded(
                      child: adlradialGauge(30),
                    ),
                    Expanded(
                      child: adlradialGauge(70),
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
                      child: adlradialGauge(50),
                    ),
                    Expanded(
                      child: adlradialGauge(30),
                    ),
                    Expanded(
                      child: adlradialGauge(40),
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
                      child: adlradialGauge(50),
                    ),
                    Expanded(
                      child: adlradialGauge(20),
                    ),
                    Expanded(
                      child: adlradialGauge(50),
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
                      child: adlradialGauge(50),
                    ),
                    Expanded(
                      child: adlradialGauge(30),
                    ),
                    Expanded(
                      child: adlradialGauge(60),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );
}
