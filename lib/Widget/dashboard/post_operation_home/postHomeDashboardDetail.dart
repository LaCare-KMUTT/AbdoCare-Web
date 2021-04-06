import 'package:AbdoCare_Web/page/dashboard_postHos.dart';
import 'package:flutter/material.dart';

import '../dashboardGraph.dart';
import 'postHomeDashboardPatientDetail.dart';

import '../../../page/dashboard_pre.dart';
import '../../../page/dashboard_postHome.dart';

class PostHomeDashboardDetail extends StatefulWidget {
  PostHomeDashboardDetail({Key key}) : super(key: key);
  @override
  _PostHomeDashboardDetailState createState() =>
      _PostHomeDashboardDetailState();
}

class _PostHomeDashboardDetailState extends State<PostHomeDashboardDetail> {
  final ScrollController controller = ScrollController();

  String dropdownValue = 'Post-Operation@Home';
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
                                  Navigator.pushNamed(
                                      context, '/dashboard_pre');

                                  break;
                                case "Post-Operation@Hospital":
                                  Navigator.pushNamed(
                                      context, '/dashboard_postHos');

                                  break;
                                case "Post-Operation@Home":
                                  Navigator.pushNamed(
                                      context, '/dashboard_postHome');
                                  break;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(child: PostHomePatientDetail()),
                SizedBox(child: ShowDashboard())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
