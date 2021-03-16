import 'package:AbdoCare_Web/Widget/customMaterial.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/genetalFormBody.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/adlFormBody.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatus.dart';

import 'package:flutter/material.dart';

import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/service_locator.dart';

class PrevisitForm extends StatefulWidget {
  PrevisitForm({Key key}) : super(key: key);
  @override
  _PrevisitFormState createState() => _PrevisitFormState();
}

enum ConsentSigned { patient, other }

class _PrevisitFormState extends State<PrevisitForm> {
  ICalculationService _calculationService = locator<ICalculationService>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: LayoutBuilder(builder: (context, constraints) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(screenSize.height / 70),
                child: Container(
                  child: Center(
                    child: Text(
                      'บันทึกการเยี่ยมผู้รับบริการสูงอายุก่อนผ่าตัด(Pre-visit)',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFC37447),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: SafeArea(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: constraints.minWidth,
                            minHeight: constraints.minHeight),
                        child: IntrinsicWidth(
                          child: Column(
                            children: [
                              Card(
                                  child: Column(
                                children: [
                                  Container(child: GeneralFormBody()),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(
                                      color: Colors.grey[300],
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                  ),
                                  Container(child: ADLFormBody()),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(
                                      color: Colors.grey[300],
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                  ),
                                  Container(child: HealthStatusBody()),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
