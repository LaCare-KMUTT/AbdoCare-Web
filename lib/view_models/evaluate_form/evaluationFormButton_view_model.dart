import 'package:intl/intl.dart';

class EvaluationFormViewModel {
  // the variable 'check' used to check whether the form has been filled or not
  bool disableVitalSignButton1(bool check) {
    DateTime now = DateTime.now();
    DateTime formTime1 = DateFormat.Hm().parse("02:00");
    formTime1 = new DateTime(
        now.year, now.month, now.day, formTime1.hour, formTime1.minute);
    if (now.isAfter(formTime1) && check == false) {
      return true;
    }
    return false;
  }

  bool disableVitalSignButton2(bool check) {
    DateTime now = DateTime.now();
    DateTime formTime2 = DateFormat.Hm().parse("06:00");
    formTime2 = new DateTime(
        now.year, now.month, now.day, formTime2.hour, formTime2.minute);
    if (now.isAfter(formTime2) && check == false) {
      return true;
    }
    return false;
  }

  bool disableVitalSignButton3(bool check) {
    DateTime now = DateTime.now();
    DateTime formTime3 = DateFormat.Hm().parse("10:00");
    formTime3 = new DateTime(
        now.year, now.month, now.day, formTime3.hour, formTime3.minute);
    if (now.isAfter(formTime3) && check == false) {
      return true;
    }
    return false;
  }

  bool disableVitalSignButton4(bool check) {
    DateTime now = DateTime.now();
    DateTime formTime4 = DateFormat.Hm().parse("14:00");
    formTime4 = new DateTime(
        now.year, now.month, now.day, formTime4.hour, formTime4.minute);
    if (now.isAfter(formTime4) && check == false) {
      return true;
    }
    return false;
  }

  bool disableVitalSignButton5(bool check) {
    DateTime now = DateTime.now();
    DateTime formTime5 = DateFormat.Hm().parse("18:00");
    formTime5 = new DateTime(
        now.year, now.month, now.day, formTime5.hour, formTime5.minute);
    if (now.isAfter(formTime5) && check == false) {
      return true;
    }
    return false;
  }

  bool disableVitalSignButton6(bool check) {
    DateTime now = DateTime.now();
    DateTime formTime6 = DateFormat.Hm().parse("22:00");
    formTime6 = new DateTime(
        now.year, now.month, now.day, formTime6.hour, formTime6.minute);
    if (now.isAfter(formTime6) && check == false) {
      return true;
    }

    return false;
  }

  bool disableRespiratoryDay0Button(bool check) {
    if (check == false) {
      return true;
    }
    return false;
  }

  bool disableUrologyButton(bool check) {
    if (check == false) {
      return true;
    }
    return false;
  }

  bool disableBloodClotButton(bool check) {
    if (check == false) {
      return true;
    }
    return false;
  }

  bool disableDrainButton(bool check) {
    if (check == false) {
      return true;
    }
    return false;
  }

  bool disableNutritionButton(bool check) {
    if (check == false) {
      return true;
    }
    return false;
  }

  bool disableRespiratoryDay1Button(bool check) {
    if (check == false) {
      return true;
    }
    return false;
  }

  bool disableDigestiveButton(bool check) {
    if (check == false) {
      return true;
    }
    return false;
  }

  bool disableInfectionButton(bool check) {
    if (check == false) {
      return true;
    }
    return false;
  }

  bool disablePulmanaryButton(bool check) {
    if (check == false) {
      return true;
    }
    return false;
  }

  bool disableRecoveryReadinessButton(bool check) {
    if (check == false) {
      return true;
    }
    return false;
  }
}
