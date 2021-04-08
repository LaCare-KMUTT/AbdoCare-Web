import 'package:flutter/material.dart';

import '../../../page/dashboard_pre.dart';
import '../../../page/dashboard_postHome.dart';
import '../../../page/dashboard_postHos.dart';

import '../dashboardGraph.dart';
import 'postHosDashboardPatientDetail.dart';

class PostHosDashboardDetail extends StatefulWidget {
  PostHosDashboardDetail({Key key}) : super(key: key);
  @override
  _PostHosDashboardDetailState createState() => _PostHosDashboardDetailState();
}

class _PostHosDashboardDetailState extends State<PostHosDashboardDetail> {
  final ScrollController controller = ScrollController();

  Container myArticles(String heading) {
    return Container(
      width: 160.0,
      child: Card(
        child: Wrap(
          children: [
            ListTile(
              title: Text(
                heading,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  textColor: Colors.black,
                  color: Color(0xFFEBEBEB),
                  child: Text('แบบประเมิน', style: TextStyle(fontSize: 12)),
                  onPressed: () {
                    print('แบบประเมินระบบทางเดินหายใจ');
                    setState(() {});
                    Navigator.pushNamed(context, '/addPatient_page');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String dropdownValue = 'Post-Operation@Hospital';
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
                                            PreDashboardPage()),
                                  );
                                  break;
                                case "Post-Operation@Hospital":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PostHosDashboardPage()),
                                  );
                                  break;
                                case "Post-Operation@Home":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PostHomeDashboardPage()),
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
                  // Vertical ListView
                  child: PostHosPatientDetail(),
                ),
                // not in nsc scope
                //
                // SizedBox(
                //   // Horizontal ListView
                //   height: 160,
                //   child: Card(
                //     margin: EdgeInsets.all(10),
                //     child: Scrollbar(
                //       isAlwaysShown: false,
                //       controller: controller,
                //       child: ListView(
                //         controller: controller,
                //         scrollDirection: Axis.horizontal,
                //         children: <Widget>[
                //           myArticles('แบบประเมินความพร้อมการฟื้นสภาพ'),
                //           myArticles('แบบประเมินการจัดการความปวด'),
                //           myArticles(
                //               'แบบประเมินการจัดการแผลผ่าตัดสายระบายต่างๆ'),
                //           myArticles('แบบประเมินระบบทางเดินหายใจ'),
                //           myArticles('แบบประเมินระบบปัสสาวะ'),
                //           myArticles(''),
                //           myArticles(''),
                //         ],
                //       ),
                //       // child: ListView.builder(
                //       //   itemCount: 20,
                //       //   scrollDirection: Axis.horizontal,
                //       //   itemBuilder: (context, index) {
                //       //     return Container(
                //       //       width: 100,
                //       //       alignment: Alignment.center,
                //       //       color: Colors.blue[(index % 9) * 100],
                //       //       child: Text(index.toString()),
                //       //     );
                //       //   },
                //       // ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  // Vertical ListView
                  child: ShowDashboard(patientstate: 'Post-Operation@Hospital'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
