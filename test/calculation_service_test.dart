import 'package:AbdoCare_Web/services/interfaces/calculation_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    setupServiceLocator();
    locator.allowReassignment = true;
  });
  group('calculateAge test', () {
    test('calculateAge should be able to calculate when string is injected',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();

      var age = _calculationService.calculateAge(birthDateString: '2542-03-12');
      var ageWithTime =
          _calculationService.calculateAge(birthDateString: '2542-03-12 10:00');
      expect(age, 21);
      expect(ageWithTime, 21);
    });

    test('calculationAge should be able to calculate when Datetime is injected',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();

      var age =
          _calculationService.calculateAge(birthDate: DateTime(2542, 03, 12));
      expect(age, 21);
    });
  });

  group('formatDate test', () {
    test('formatDate should be able to format year to buddhist year', () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate =
          _calculationService.formatDate(date: DateTime(1999, 03, 12));
      expect(formattedDate, DateTime(2542, 03, 12));
    });
    test(
        'formatDate should be able to format year to buddhist year when date has time',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate = _calculationService.formatDate(
          date: DateTime(1999, 03, 12, 17, 58, 19));
      expect(formattedDate, DateTime(2542, 03, 12, 17, 58, 19));
    });

    test('formatDate should be able to format date When receieve string input',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate =
          _calculationService.formatDate(dateString: '1999-03-12');
      expect(formattedDate, DateTime(2542, 03, 12));
    });
  });

  group('formatDateToThaiString test', () {
    test(
        'formatDateToThaiString should be able to format when receieve DateTime',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate = _calculationService.formatDateToThaiString(
          date: DateTime(1999, 03, 12));
      expect(formattedDate, 'วันศุกร์ที่ 12 มีนาคม พ.ศ. 2542');
    });

    test(
        'formatDateToThaiString should be able to format when receieve String date',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate =
          _calculationService.formatDateToThaiString(dateString: '1999-03-12');
      expect(formattedDate, 'วันศุกร์ที่ 12 มีนาคม พ.ศ. 2542');
    });
  });
}
