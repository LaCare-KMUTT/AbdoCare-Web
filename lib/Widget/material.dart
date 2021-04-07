import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomMaterial {
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  Color getTemperatureColor(dynamic temperature) {
    if (temperature == '-') {
      return Color(0xFFC37447);
    } else {
      if (temperature < 36.0 || temperature > 37.0) {
        return Colors.red;
      }
    }
    return Colors.green;
  }

  Color getRespirationRateColor(dynamic respirationRate) {
    if (respirationRate == '-') {
      return Color(0xFFC37447);
    } else {
      if (respirationRate < 16 || respirationRate > 20) {
        return Colors.red;
      }
    }
    return Colors.green;
  }

  Color getHeartRateColor(dynamic heartRate) {
    if (heartRate == '-') {
      return Color(0xFFC37447);
    } else {
      if (heartRate < 60 || heartRate > 100) {
        return Colors.red;
      }
    }
    return Colors.green;
  }

  Color getBloodPressureColor(dynamic bloodPressure) {
    if (bloodPressure == '-') {
      return Color(0xFFC37447);
    } else {
      var parts = bloodPressure.split('/');
      var s = parts[0].trim();
      var d = parts[1].trim();
      var systolic = int.parse(s);
      var diastolic = int.parse(d);
      if (systolic >= 130 || diastolic >= 80) {
        return Colors.red;
      }
    }
    return Colors.green;
  }

  Color getOxygenRateColor(dynamic oxygenRate) {
    if (oxygenRate == '-') {
      return Color(0xFFC37447);
    } else {
      if (oxygenRate <= 95) {
        return Colors.red;
      }
    }
    return Colors.green;
  }

  Color getStatusColor(String status) {
    if (status == 'ปกติ') {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  Color getPainScoreColor(dynamic painScore) {
    if (painScore == '-') {
      return Color(0xFFC37447);
    } else {
      if (painScore >= 8) {
        return Colors.red;
      }
    }
    return Colors.green;
  }

  Color getWoundImgColor(String woundImg) {
    if (woundImg == 'ได้รับรูปภาพ') {
      return Colors.lightBlue;
    }
    return Colors.black;
  }

  bool disableVirtalSignButton1(bool check) {
    DateTime now = DateTime.now();
    DateTime formTime1 = DateFormat.Hm().parse("02:00");
    formTime1 = new DateTime(
        now.year, now.month, now.day, formTime1.hour, formTime1.minute);
    if (now.isAfter(formTime1) && check == false) {
      return true;
    }
    return false;
  }

  bool disableVirtalSignButton2(bool check) {
    DateTime now = DateTime.now();
    DateTime formTime2 = DateFormat.Hm().parse("06:00");
    formTime2 = new DateTime(
        now.year, now.month, now.day, formTime2.hour, formTime2.minute);
    if (now.isAfter(formTime2) && check == false) {
      return true;
    }
    return false;
  }

  bool disableVirtalSignButton3(bool check) {
    DateTime now = DateTime.now();
    DateTime formTime3 = DateFormat.Hm().parse("10:00");
    formTime3 = new DateTime(
        now.year, now.month, now.day, formTime3.hour, formTime3.minute);
    if (now.isAfter(formTime3) && check == false) {
      return true;
    }
    return false;
  }

  bool disableVirtalSignButton4(bool check) {
    DateTime now = DateTime.now();
    DateTime formTime4 = DateFormat.Hm().parse("14:00");
    formTime4 = new DateTime(
        now.year, now.month, now.day, formTime4.hour, formTime4.minute);
    if (now.isAfter(formTime4) && check == false) {
      return true;
    }
    return false;
  }

  bool disableVirtalSignButton5(bool check) {
    DateTime now = DateTime.now();
    DateTime formTime5 = DateFormat.Hm().parse("18:00");
    formTime5 = new DateTime(
        now.year, now.month, now.day, formTime5.hour, formTime5.minute);
    if (now.isAfter(formTime5) && check == false) {
      return true;
    }
    return false;
  }

  bool disableVirtalSignButton6(bool check) {
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
}
