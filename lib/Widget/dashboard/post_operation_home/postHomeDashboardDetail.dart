import 'package:flutter/material.dart';
import '../state_dropdown.dart';
import '../dashboardGraph.dart';
import 'postHomeDashboardPatientDetail.dart';

class PostHomeDashboardDetail extends StatefulWidget {
  final String hn;
  PostHomeDashboardDetail({Key key, @required this.hn}) : super(key: key);
  @override
  _PostHomeDashboardDetailState createState() =>
      _PostHomeDashboardDetailState();
}

class _PostHomeDashboardDetailState extends State<PostHomeDashboardDetail> {
  final ScrollController controller = ScrollController();
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
                      child: Dropdown(
                          dropdownValue: 'Post-Operation@Home', hn: widget.hn)),
                ),
                SizedBox(
                  child: PostHomePatientDetail(
                    hn: widget.hn,
                  ),
                ),
                SizedBox(
                  child: ShowDashboard(
                      patientstate: 'Post-Operation@Home', hn: widget.hn),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
