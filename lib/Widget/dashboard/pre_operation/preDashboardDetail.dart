import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusForm/healthStatus.dart';
import 'package:flutter/material.dart';

import '../../../page/dashboard_postHome.dart';
import '../../../page/dashboard_postHos.dart';
import '../../../page/dashboard_pre.dart';
import '../dashboardGraph.dart';
import 'preDashboardPatientDetail.dart';

class PreDashboardDetail extends StatefulWidget {
  final String hn;
  PreDashboardDetail({Key key, @required this.hn}) : super(key: key);
  @override
  _PreDashboardDetailState createState() => _PreDashboardDetailState();
}

class _PreDashboardDetailState extends State<PreDashboardDetail> {
  final ScrollController controller = ScrollController();

  Container formCard(String heading) {
    return Container(
      width: 400,
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Wrap(
            children: [
              ListTile(
                title: Text(
                  heading,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      textColor: Colors.black,
                      color: Color(0xFFEBEBEB),
                      child: Text('แบบประเมิน', style: TextStyle(fontSize: 15)),
                      onPressed: () {
                        print('$heading : ${widget.hn}');
                        setState(() {});
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => ADLForm(
                        //         hn: widget.hn,
                        //       ),
                        //     ));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => GeneralForm(
                        //         hn: widget.hn,
                        //       ),
                        //     ));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HealthStatusForm(
                                hn: widget.hn,
                              ),
                            ));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String dropdownValue = 'Pre-Operation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: dropdownValue,
                          items: <String>[
                            'Pre-Operation',
                            'Post-Operation@Hospital',
                            'Post-Operation@Home'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                  child: Text(value,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFFC37447)))),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              switch (newValue) {
                                case "Pre-Operation":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PreDashboardPage(hn: widget.hn)),
                                  );
                                  break;
                                case "Post-Operation@Hospital":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PostHosDashboardPage(
                                                hn: widget.hn)),
                                  );
                                  break;
                                case "Post-Operation@Home":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PostHomeDashboardPage(
                                                hn: widget.hn)),
                                  );
                                  break;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: PrePatientDetail(),
                ),
                SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      child: Scrollbar(
                        isAlwaysShown: false,
                        controller: controller,
                        child: ListView(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'แบบประเมิน',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFC37447)),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            formCard('แบบประเมิน Pre-Visit'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: ShowDashboard(patientstate: 'Pre-Operation'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
