import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ADLChart extends StatelessWidget {
  @override
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
                      child: Container(
                        height: 100,
                        width: 100,
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
                                  RangePointer(
                                      value: 500,
                                      width: 20,
                                      color: Color(0xFFC37447))
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('100 %',
                                              style: TextStyle(fontSize: 16))),
                                      angle: 90,
                                      positionFactor: 0.2)
                                ]),
                          ],
                        ),
                      ),
                    ),
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
                      child: Container(
                        height: 100,
                        width: 100,
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
                                  RangePointer(
                                      value: 50,
                                      width: 20,
                                      color: Color(0xFFC37447))
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('50 %',
                                              style: TextStyle(fontSize: 16))),
                                      angle: 90,
                                      positionFactor: 0.2)
                                ]),
                          ],
                        ),
                      ),
                    )
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
                      child: Container(
                        height: 100,
                        width: 100,
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
                                  RangePointer(
                                      value: 500,
                                      width: 20,
                                      color: Color(0xFFC37447))
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('100 %',
                                              style: TextStyle(fontSize: 16))),
                                      angle: 90,
                                      positionFactor: 0.2)
                                ]),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การใช้ห้องน้ำ',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        width: 100,
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
                                  RangePointer(
                                      value: 50,
                                      width: 20,
                                      color: Color(0xFFC37447))
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('50 %',
                                              style: TextStyle(fontSize: 16))),
                                      angle: 90,
                                      positionFactor: 0.2)
                                ]),
                          ],
                        ),
                      ),
                    )
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
                      child: Container(
                        height: 100,
                        width: 100,
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
                                  RangePointer(
                                      value: 500,
                                      width: 20,
                                      color: Color(0xFFC37447))
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('100 %',
                                              style: TextStyle(fontSize: 16))),
                                      angle: 90,
                                      positionFactor: 0.2)
                                ]),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การเคลื่อนที่ภายในห้องหรือบ้าน',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        width: 100,
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
                                  RangePointer(
                                      value: 50,
                                      width: 20,
                                      color: Color(0xFFC37447))
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('50 %',
                                              style: TextStyle(fontSize: 16))),
                                      angle: 90,
                                      positionFactor: 0.2)
                                ]),
                          ],
                        ),
                      ),
                    )
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
                      child: Container(
                        height: 100,
                        width: 100,
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
                                  RangePointer(
                                      value: 50,
                                      width: 20,
                                      color: Color(0xFFC37447))
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('50 %',
                                              style: TextStyle(fontSize: 16))),
                                      angle: 90,
                                      positionFactor: 0.2)
                                ]),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การอาบน้ำ',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        width: 100,
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
                                  RangePointer(
                                      value: 100,
                                      width: 20,
                                      color: Color(0xFFC37447))
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('100 %',
                                              style: TextStyle(fontSize: 16))),
                                      angle: 90,
                                      positionFactor: 0.2)
                                ]),
                          ],
                        ),
                      ),
                    )
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
                      child: Container(
                        height: 100,
                        width: 100,
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
                                  RangePointer(
                                      value: 75,
                                      width: 20,
                                      color: Color(0xFFC37447))
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('75 %',
                                              style: TextStyle(fontSize: 16))),
                                      angle: 90,
                                      positionFactor: 0.2)
                                ]),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text('การกลั้นอุจจาระในระยะ 1 สัปดาห์ที่ผ่านมา',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        width: 100,
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
                                  RangePointer(
                                      value: 25,
                                      width: 20,
                                      color: Color(0xFFC37447))
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('25 %',
                                              style: TextStyle(fontSize: 16))),
                                      angle: 90,
                                      positionFactor: 0.2)
                                ]),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      );
}
