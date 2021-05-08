import 'package:AbdoCare_Web/Widget/evaluationForms/evaluation_manu_card.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day0/recovery_readiness_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day0/respiratory_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day0/urology_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day1/blood_clot_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day1/drain_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day1/nutrition_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day1/respiratory_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day2-7/digestive_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day2-7/infection_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day2-7/pulmanary_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/vital_sign_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/generalForm/generalForm.dart';
import 'package:AbdoCare_Web/models/evalutate_form/evaluation_model.dart';
import 'package:AbdoCare_Web/models/notification_list/formName_Notification_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EvaluationViewModel {
  EvaluationViewModel();
  final _firebaseService = locator<IFirebaseService>();
  final _evaluationModel = locator<EvaluationModel>();
  Future<Map<String, Widget>> getevaluations(
      BuildContext context, String hn, String patientState) async {
    var evaluateStatus;
    List<Map<String, Object>> mustShowList = [];
    List<Map<String, Object>> mustShowList2 = [];
    List<Map<String, Object>> vitalSignList = [];
    List<Widget> mustShowCardList = [];
    List<Widget> mustShowCardList2 = [];
    List<Widget> vitalSignCardList = [];
    Column mustShowToColumn = Column();
    Column mustShowToColumn2 = Column();
    Column vitalSignToColumn = Column();
    Row mustShow = Row();

    var dayInCurrentState = await _firebaseService.getDayInCurrentState(hn: hn);

    if (patientState == "Pre-Operation") {
      mustShowList.addAll(_evaluationModel.preOpHos);
      vitalSignList.addAll(_evaluationModel.vitalSignList);
    } else if (patientState == "Post-Operation@Hospital") {
      if (dayInCurrentState == 0) {
        mustShowList.addAll(_evaluationModel.postOpHospitalDay0List);
        mustShowList2.addAll(_evaluationModel.postOpHospitalDay0List2);
        vitalSignList.addAll(_evaluationModel.vitalSignList);
      }
      if (dayInCurrentState == 1) {
        mustShowList.addAll(_evaluationModel.postOpHospitalDay1List);
        mustShowList2.addAll(_evaluationModel.postOpHospitalDay1List2);
        vitalSignList.addAll(_evaluationModel.vitalSignList);
      }
      if (dayInCurrentState >= 2) {
        mustShowList.addAll(_evaluationModel.postOpHospitalDay2List);
        vitalSignList.addAll(_evaluationModel.vitalSignList);
      }
    }
    //Used for getVitalSignCardList
    for (var item in vitalSignList) {
      var formName = formNameModel[item['formName']];
      var formTime = item['formTime'];
      evaluateStatus = await _firebaseService.getEvaluationStatus(
          hn: hn,
          formName: formName,
          patientState: patientState,
          vitalSignFormTime: formTime);
      vitalSignCardList.add(EvaluationMenuCard()
          .getVitalSignCard(context, item, evaluateStatus, hn, formTime));
    }

    if (vitalSignCardList != null) {
      vitalSignToColumn = Column(
        children: vitalSignCardList,
      );
    }
    //Used for get EvaluationForm first column card list
    for (var item in mustShowList) {
      var formName = formNameModel[item['formName']];
      evaluateStatus = await _firebaseService.getEvaluationStatus(
          hn: hn, formName: formName, patientState: patientState);
      mustShowCardList.add(EvaluationMenuCard()
          .getEvaluationCard(context, item, evaluateStatus, hn));
    }

    if (mustShowCardList != null) {
      mustShowToColumn = Column(
        children: mustShowCardList,
      );
    }
    //Used for get EvaluationForm second column card list
    for (var item in mustShowList2) {
      var formName = formNameModel[item['formName']];
      evaluateStatus = await _firebaseService.getEvaluationStatus(
          hn: hn, formName: formName, patientState: patientState);
      mustShowCardList2.add(EvaluationMenuCard()
          .getEvaluationCard(context, item, evaluateStatus, hn));
    }

    if (mustShowCardList2 != null) {
      mustShowToColumn2 = Column(children: mustShowCardList2);
    }
    mustShow = Row(
      children: [mustShowToColumn, mustShowToColumn2],
    );

    Map<String, Widget> cardLists = {
      'mustShow': mustShow,
      'vitalSignShow': vitalSignToColumn,
    };
    return cardLists;
  }

  navigateOnTopic(EvaluationFormTopic selected, String hn,
      String evaluateStatus, String formTime) {
    switch (selected) {
      case EvaluationFormTopic.recoveryReadiness0:
        return RecoveryReadinessForm(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.respiratory0:
        return RespiratoryDay0Form(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.drain0:
        return DrainForm(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.urology0:
        return UrologyForm(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.respiratory1:
        return RespiratoryDay1Form(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.drain1:
        return DrainForm(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.bloodclot1:
        return BloodClotForm(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.nutrition1:
        return NutritionForm(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.infection2:
        return InfectionForm(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.pulmanary2:
        return PulmanaryForm(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.digestive2:
        return DigestiveForm(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.generalForm:
        return GeneralForm(hn: hn, evaluateStatus: evaluateStatus);
        break;
      case EvaluationFormTopic.vitalSign1:
        return VitalSignForm(
          hn: hn,
          evaluateStatus: evaluateStatus,
          formTime: formTime,
        );
        break;
      case EvaluationFormTopic.vitalSign2:
        return VitalSignForm(
          hn: hn,
          evaluateStatus: evaluateStatus,
          formTime: formTime,
        );
        break;
      case EvaluationFormTopic.vitalSign3:
        return VitalSignForm(
          hn: hn,
          evaluateStatus: evaluateStatus,
          formTime: formTime,
        );
        break;
      case EvaluationFormTopic.vitalSign4:
        return VitalSignForm(
          hn: hn,
          evaluateStatus: evaluateStatus,
          formTime: formTime,
        );
        break;
      case EvaluationFormTopic.vitalSign5:
        return VitalSignForm(
          hn: hn,
          evaluateStatus: evaluateStatus,
          formTime: formTime,
        );
        break;
      case EvaluationFormTopic.vitalSign6:
        return VitalSignForm(
          hn: hn,
          evaluateStatus: evaluateStatus,
          formTime: formTime,
        );
        break;
    }
  }

  bool disableEvaluationformButton(String check) {
    if (check == "completed") {
      return true;
    }
    return false;
  }

  bool disableVitalSignformButton(String check, String formTime) {
    DateTime now = DateTime.now();
    var formTimeSplit = formTime.split(" ");
    var newFormTime = formTimeSplit[0];
    DateTime formTimeToCompare = DateFormat.Hm().parse(newFormTime);
    formTimeToCompare = new DateTime(now.year, now.month, now.day,
        formTimeToCompare.hour, formTimeToCompare.minute);
    if (check == "completed" || now.isBefore(formTimeToCompare)) {
      return true;
    }
    return false;
  }
}
