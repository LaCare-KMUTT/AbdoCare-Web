import 'package:flutter/material.dart';

class ProgressBar {
  static circularProgressIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProgressIndicator(strokeWidth: 4),
    );
  }
}
