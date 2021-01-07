import 'package:AbdoCare_Web/Widget/dashboardGraph.dart';
import 'package:flutter/material.dart';

import '../Widget/dashboardPatientDetail.dart';

class DashboardDetail extends StatefulWidget {
  DashboardDetail({Key key}) : super(key: key);
  @override
  _DashboardDetailState createState() => _DashboardDetailState();
}

class _DashboardDetailState extends State<DashboardDetail> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  // Vertical ListView
                  child: PatientDetail(),
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
