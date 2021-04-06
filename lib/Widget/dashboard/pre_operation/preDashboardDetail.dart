import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/generalForm/generalForm.dart';
import 'package:flutter/material.dart';

import 'preDashboardPatientDetail.dart';
import '../dashboardGraph.dart';

import '../../../page/dashboard_postHome.dart';
import '../../../page/dashboard_postHos.dart';
import '../../../page/dashboard_pre.dart';

class PreDashboardDetail extends StatefulWidget {
  final String hn;
  PreDashboardDetail({Key key, @required this.hn}) : super(key: key);
  @override
  _PreDashboardDetailState createState() => _PreDashboardDetailState();
}

class _PreDashboardDetailState extends State<PreDashboardDetail> {
  final ScrollController controller = ScrollController();

  Container myArticles(String heading) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: screenSize.width / 5,
      height: screenSize.width / 4,
      child: Card(
        child: ListView(
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
                  margin: EdgeInsets.only(bottom: 5),
                  child: RaisedButton(
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    textColor: Colors.black,
                    color: Color(0xFFEBEBEB),
                    child: Text('แบบประเมิน', style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      print(heading);
                      setState(() {});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GeneralForm(
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
    );
  }

  String dropdownValue = 'Pre-Operation';
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
                  child: PrePatientDetail(),
                ),
                SizedBox(
                  height: 160,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: Scrollbar(
                        isAlwaysShown: false,
                        controller: controller,
                        child: ListView(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            myArticles('แบบประเมิน Pre-Visit'),
                          ],
                        ),
                        // child: ListView.builder(
                        //   itemCount: 20,
                        //   scrollDirection: Axis.horizontal,
                        //   itemBuilder: (context, index) {
                        //     return Container(
                        //       width: 100,
                        //       alignment: Alignment.center,
                        //       color: Colors.blue[(index % 9) * 100],
                        //       child: Text(index.toString()),
                        //     );
                        //   },
                        // ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // Vertical ListView
                  child: ShowDashboard(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
