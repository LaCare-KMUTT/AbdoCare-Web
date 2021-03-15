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
      expect(age, 22);
      expect(ageWithTime, 22);
    });

    test('calculationAge should be able to calculate when Datetime is injected',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();

      var age =
          _calculationService.calculateAge(birthDate: DateTime(2542, 03, 12));
      expect(age, 22);
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

    test('formatDate should be able to format date When receive string input',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate =
          _calculationService.formatDate(dateString: '1999-03-12');
      expect(formattedDate, DateTime(2542, 03, 12));
    });
  });

  group('formatDateToThaiString test', () {
    test(
        'formatDateToThaiString should be able to format when receive DateTime in Christ year',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate = _calculationService.formatDateToThaiString(
          date: DateTime(1999, 03, 12), isBuddhist: false);
      expect(formattedDate, 'วันศุกร์ที่ 12 มีนาคม พ.ศ. 2542');
    });

    test(
        'formatDateToThaiString should be able to format when receive String date in Christ year',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate = _calculationService.formatDateToThaiString(
          dateString: '1999-03-12', isBuddhist: false);
      expect(formattedDate, 'วันศุกร์ที่ 12 มีนาคม พ.ศ. 2542');
    });
    test(
        'formatDateToThaiString should be able to format when receive DateTime with Buddhist year',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate = _calculationService.formatDateToThaiString(
          date: DateTime(2542, 03, 12), isBuddhist: true);
      expect(formattedDate, 'วันศุกร์ที่ 12 มีนาคม พ.ศ. 2542');
    });
    test(
        'formatDateToThaiString should be able to format when receieve String date in Buddhist year',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate = _calculationService.formatDateToThaiString(
          dateString: '2542-03-12', isBuddhist: true);
      expect(formattedDate, 'วันศุกร์ที่ 12 มีนาคม พ.ศ. 2542');
    });
  });

  group('Calculate calculateDayDifference', () {
    test('calculateDayDifference should return correct difference in day', () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var dayDifference = _calculationService.calculateDayDifference(
          day: DateTime(1999, 03, 15), compareTo: DateTime(1999, 03, 12));
      expect(dayDifference, 3);
    });

    test('calculateDayDifference should always return positive number', () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var day1 = _calculationService.calculateDayDifference(
          day: DateTime(1999, 03, 12), compareTo: DateTime(1999, 03, 13));
      var day2 = _calculationService.calculateDayDifference(
          day: DateTime(1999, 03, 13), compareTo: DateTime(1999, 03, 12));
      expect(day1, 1);
      expect(day2, 1);
      expect(day1, day2);
    });
  });
}
