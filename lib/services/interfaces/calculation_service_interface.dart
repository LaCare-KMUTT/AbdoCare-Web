import 'package:flutter/material.dart';

abstract class ICalculationService {
  int calculateAge({DateTime birthDate, String birthDateString});

  DateTime formatDate({DateTime date, String dateString});

  /// If `date`/`dateString` is already a buddhist year. Set `isBuddhist = true`
  String formatDateToThaiString(
      {DateTime date, String dateString, @required bool isBuddhist});

  int calculateDayDifference(
      {@required DateTime day, @required DateTime compareTo});

  String calculateBML({@required int oldWeight, @required int weight});
}
