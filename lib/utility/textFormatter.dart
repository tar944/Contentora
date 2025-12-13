import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TextFormatter extends TextInputFormatter {
  final NumberFormat formatter = NumberFormat.decimalPattern();

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    String text = newValue.text;

    // Handle empty
    if (text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Split integer + decimal
    List<String> parts = text.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '';

    // Remove non-digits from the integer part
    integerPart = integerPart.replaceAll(RegExp(r'[^0-9]'), '');

    // Avoid parsing empty string
    if (integerPart.isEmpty) integerPart = '0';

    // Format with intl
    String formattedInteger = formatter.format(int.parse(integerPart));

    // Rebuild final text
    String result = formattedInteger;
    if (parts.length > 1) {
      result += '.$decimalPart';
    }

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }

}