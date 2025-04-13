import 'package:flutter/services.dart';

class HalfStepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    // Allow empty input
    if (text.isEmpty) {
      return newValue;
    }

    // Try parsing the input as a double
    final value = double.tryParse(text);
    if (value == null) {
      return oldValue; // Reject non-numeric input
    }

    // Check if the value is within the range 0 to 5
    if (value < 0 || value > 5) {
      return oldValue;
    }

    // Check if the value is in 0.5 increments
    if ((value * 10) % 5 != 0) {
      return oldValue;
    }

    return newValue;
  }
}
