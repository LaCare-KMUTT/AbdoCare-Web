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

  Color getBloodPressureColor(
      int systolic, int diastolic, dynamic bloodPressure) {
    if (bloodPressure == '-') {
      return Color(0xFFC37447);
    } else {
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

  EdgeInsets getEdgeInsetLTRB7070700(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return EdgeInsets.fromLTRB(screenSize.height / 70, screenSize.height / 70,
        screenSize.height / 70, 0);
  }
}
