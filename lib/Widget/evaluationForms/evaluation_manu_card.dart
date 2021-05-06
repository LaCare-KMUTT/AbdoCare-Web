import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluation_view_model.dart';
import 'package:flutter/material.dart';

class EvaluationMenuCard {
  final EvaluationViewModel _evaluationViewModel =
      locator<EvaluationViewModel>();
  Widget getEvaluationCard(BuildContext context, Map<String, Object> item,
      String evaluateStatus, String hn) {
    var evaluationCard = Container(
      width: 400,
      height: 140,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    item['formName'],
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: _evaluationViewModel.navigateOnTopic(
                        item['selectedForm'], hn, evaluateStatus),
                  ),
                ),
              ],
            ),
          )),
    );
    return evaluationCard;
  }
}
