import 'package:AbdoCare_Web/services/interfaces/calculation_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    setupServiceLocator();
    locator.allowReassignment = true;
  });
  group('CalculateAge test', () {
    test('calculateAge should be able to calculate when string is injected',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();

      var age = _calculationService.calculateAge(birthDateString: '1999-03-12');
      var ageWithTime =
          _calculationService.calculateAge(birthDateString: '1999-03-12 10:00');
      expect(age, 21);
      expect(ageWithTime, 21);
    });

    test('calculationAge should be able to calculate when Datetime is injected',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();

      var age =
          _calculationService.calculateAge(birthDate: DateTime(1999, 03, 12));
      expect(age, 21);
    });
  });
}
