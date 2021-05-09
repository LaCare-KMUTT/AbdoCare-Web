import 'package:AbdoCare_Web/Widget/dashboard/post_operation_hospital/postHosDashboardPatientDetail.dart';
import 'package:AbdoCare_Web/Widget/dashboard/state_dropdown.dart';
import 'package:AbdoCare_Web/Widget/shared/progress_bar.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluation_view_model.dart';
import 'package:flutter/material.dart';
import '../dashboardGraph.dart';

class PostHosDashboardDetail extends StatefulWidget {
  final String hn;
  PostHosDashboardDetail({Key key, @required this.hn}) : super(key: key);
  @override
  _PostHosDashboardDetailState createState() => _PostHosDashboardDetailState();
}

class _PostHosDashboardDetailState extends State<PostHosDashboardDetail> {
  final ScrollController controller = ScrollController();
  final _firebaseService = locator<IFirebaseService>();
  final EvaluationViewModel _evaluationViewModel =
      locator<EvaluationViewModel>();

  var dayInCurrentState;
  var patientState;
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    patientState = await _firebaseService.getPatientState(hn: widget.hn);
    setState(() {});
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
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Dropdown(
                          dropdownValue: 'Post-Operation@Hospital',
                          hn: widget.hn)),
                ),
                SizedBox(
                    child: PostHosPatientDetail(
                  hn: widget.hn,
                )),
                SizedBox(
                  height: 500,
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
                                FutureBuilder<Map<String, Widget>>(
                                    future: _evaluationViewModel.getevaluations(
                                        context,
                                        widget.hn,
                                        "Post-Operation@Hospital"),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return ProgressBar
                                            .circularProgressIndicator(context);
                                      }
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 400,
                                                height: 420,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        30, 10, 30, 10),
                                                child: Card(
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Text(
                                                          "แบบประเมินสัญญาณชีพ",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      snapshot.data[
                                                          'vitalSignShow'],
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              snapshot.data['mustShow'],
                                            ],
                                          ),
                                        ],
                                      );
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: ShowDashboard(
                      patientstate: 'Post-Operation@Hospital', hn: widget.hn),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
