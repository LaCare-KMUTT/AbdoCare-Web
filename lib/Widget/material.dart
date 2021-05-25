import 'dart:ui';
import 'package:flutter/material.dart';

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

  Color getPulseRateColor(dynamic pulseRate) {
    if (pulseRate == '-') {
      return Color(0xFFC37447);
    } else {
      if (pulseRate < 60 || pulseRate > 100) {
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

  Color getNotiStatusColor(dynamic notiStatus) {
    if (notiStatus == '-') {
      return Color(0xFFC37447);
    } else {
      if (notiStatus == "ยังไม่ได้ดำเนินการ") {
        return Colors.red;
      }
    }
    return Colors.green;
  }

  Color getADLColor(dynamic adlScore) {
    if (adlScore == '-') {
      return Colors.black;
    } else if (adlScore <= 4) {
      return Colors.red;
    } else if (adlScore >= 5 && adlScore <= 8) {
      return Colors.orange;
    } else if (adlScore >= 9 && adlScore <= 11) {
      return Colors.amber;
    }
    return Colors.green;
  }
}
