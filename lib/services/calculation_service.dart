import 'interfaces/calculation_service_interface.dart';

class CalculationService extends ICalculationService {
  int calculateAge({DateTime birthDate, String birthDateString}) {
    if (birthDateString != null && birthDate == null) {
      birthDate = DateTime.parse(birthDateString);
    }
    var currentDate = DateTime.now();
    var age = currentDate.year - birthDate.year;
    var month1 = currentDate.month;
    var month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      var day1 = currentDate.day;
      var day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    print('age returned! $age');
    return age;
  }
}
