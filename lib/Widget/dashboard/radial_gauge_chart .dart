import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: SfRadialGauge(
                    enableLoadingAnimation: true,
                    animationDuration: 4000,
                    axes: <RadialAxis>[
                      RadialAxis(
                          axisLineStyle: AxisLineStyle(
                            thickness: 50,
                          ),
                          startAngle: 180,
                          endAngle: 0,
                          canScaleToFit: true,
                          interval: 2,
                          minimum: 0,
                          maximum: 20,
                          showTicks: false,
                          ranges: <GaugeRange>[
                            GaugeRange(
                                startValue: 0,
                                endValue: 4,
                                color: Colors.red,
                                startWidth: 50,
                                endWidth: 50),
                            GaugeRange(
                                startValue: 4,
                                endValue: 8,
                                color: Colors.orange,
                                startWidth: 50,
                                endWidth: 50),
                            GaugeRange(
                                startValue: 8,
                                endValue: 12,
                                color: Colors.yellow,
                                startWidth: 50,
                                endWidth: 50),
                            GaugeRange(
                                startValue: 12,
                                endValue: 20,
                                color: Colors.green,
                                startWidth: 50,
                                endWidth: 50)
                          ],
                          pointers: <GaugePointer>[
                            NeedlePointer(
                                value: 12,
                                lengthUnit: GaugeSizeUnit.logicalPixel,
                                needleLength: 80)
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Container(
                                    child: Text(
                                  'ผลคะแนน = 12 คะแนน',
                                )),
                                angle: 90,
                                positionFactor: 0.4)
                          ])
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'การแปลผล',
                          style: TextStyle(color: Color(0xFFC37447)),
                        ),
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
                ),
              ),
            ],
          ),
        ],
      );
}
