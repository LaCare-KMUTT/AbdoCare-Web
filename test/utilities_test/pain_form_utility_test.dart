import 'package:AbdoCare_Web/Widget/evaluationForms/ultilities/form_utility/pain_form_utility.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getPainFormCriteria When state is Post-Operation@Hospital', () {
    test('when day 0, score in range Should return true', () {
      var list = [];
      for (int i = 8; i <= 10; i++) {
        var result = PainFormUtility()
            .withState('Post-Operation@Hospital')
            .withDayInState(0)
            .getPainFormCriteria(i);
        list.add(result);
      }
      // ignore: avoid_function_literals_in_foreach_calls
      list.forEach((element) => expect(element, true));
    });
    test('when day 0, score not in range Should return false', () {
      var list = [];
      for (int i = 0; i <= 7; i++) {
        var result = PainFormUtility()
            .withState('Post-Operation@Hospital')
            .withDayInState(0)
            .getPainFormCriteria(i);
        list.add(result);
      }
      // ignore: avoid_function_literals_in_foreach_calls
      list.forEach((element) => expect(element, false));
    });

    test('when day 1, score in range Should return true', () {
      var list = [];
      for (int i = 4; i <= 10; i++) {
        var result = PainFormUtility()
            .withState('Post-Operation@Hospital')
            .withDayInState(1)
            .getPainFormCriteria(i);
        list.add(result);
      }
      // ignore: avoid_function_literals_in_foreach_calls
      list.forEach((element) => expect(element, true));
    });
    test('when day 1, score not in range Should return false', () {
      var list = [];
      for (int i = 0; i <= 3; i++) {
        var result = PainFormUtility()
            .withState('Post-Operation@Hospital')
            .withDayInState(1)
            .getPainFormCriteria(i);
        list.add(result);
      }
      // ignore: avoid_function_literals_in_foreach_calls
      list.forEach((element) => expect(element, false));
    });
  });

  group('getPainFormCriteria when state is not Post-Operation@Home', () {
    test('Post-Operation@Home', () {
      var result = PainFormUtility()
          .withState('Post-Operation@Home')
          .withDayInState(15)
          .getPainFormCriteria(5);
      expect(result, false);
    });
    test('Pre-Operation (Should not be here at first)', () {
      var result = PainFormUtility()
          .withState('Pre-Operation')
          .withDayInState(0)
          .getPainFormCriteria(9);
      expect(result, false);
    });
  });
}
