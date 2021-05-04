import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:AbdoCare_Web/page/dashboard_postHome.dart';
import 'package:AbdoCare_Web/page/dashboard_postHos.dart';
import 'package:AbdoCare_Web/page/dashboard_pre.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final String dropdownValue;
  final String hn;
  Dropdown({Key key, this.dropdownValue, this.hn}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  final _firebaseService = locator<IFirebaseService>();
  var patientState;
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    patientState = await _firebaseService.getPatientState(hn: widget.hn);
    print(' patientState: $patientState');
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            border: Border.all(color: Colors.black12)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            value: widget.dropdownValue,
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
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFFC37447)))),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                var stateDropdown = widget.dropdownValue;
                switch (newValue) {
                  case "Pre-Operation":
                    stateDropdown = newValue;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreDashboardPage(hn: widget.hn)));

                    break;
                  case "Post-Operation@Hospital":
                    if (patientState == 'Post-Operation@Hospital' ||
                        patientState == 'Post-Operation@Home') {
                      stateDropdown = newValue;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PostHosDashboardPage(hn: widget.hn)));
                    } else {
                      Dialogs.alertDashboardDetail(context);
                      print('{$stateDropdown} patientState: $patientState');
                    }
                    break;
                  case "Post-Operation@Home":
                    if (patientState == 'Post-Operation@Home') {
                      stateDropdown = newValue;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PostHomeDashboardPage(hn: widget.hn)));
                    } else {
                      Dialogs.alertDashboardDetail(context);
                      print('{$stateDropdown} patientState: $patientState');
                    }
                    break;
                }
              });
            },
          ),
        ),
      );
}
