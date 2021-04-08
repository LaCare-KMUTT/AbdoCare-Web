import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:AbdoCare_Web/services/interfaces/calculation_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class RoundedDatePicker {
  ICalculationService _calculationService = locator<ICalculationService>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();

  Future<DateTime> selectDate(
      BuildContext context, DateTime currentValue) async {
    final DateTime date = await showRoundedDatePicker(
      context: context,
      era: EraMode.BUDDHIST_YEAR,
      locale: Locale('th', 'TH'),
      firstDate: DateTime(DateTime.now().year - 200),
      initialDate: currentValue ?? DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      theme: ThemeData(
          primarySwatch: _customMaterial.createMaterialColor(Color(0xFFC37447)),
          fontFamily: "Prompt"),
      height: 320,
      styleDatePicker: MaterialRoundedDatePickerStyle(
        paddingDatePicker: EdgeInsets.all(0),
        paddingMonthHeader: EdgeInsets.all(20),
        paddingActionBar: EdgeInsets.all(16),
        backgroundHeaderMonth: Colors.grey[300],
        textStyleCurrentDayOnCalendar:
            TextStyle(color: Color(0xFFC37447), fontWeight: FontWeight.bold),
        decorationDateSelected:
            BoxDecoration(color: Colors.orange[600], shape: BoxShape.circle),
      ),
    );
    var dateFormatted;
    if (date != null) {
      dateFormatted = _calculationService.formatDate(date: date);
    }
    return dateFormatted;
  }
}
