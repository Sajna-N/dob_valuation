import 'package:flutter/material.dart';

import '../constants/constants.dart';

class DateOfBirthFormatter {
  static var dayValue, monthValue;

  static void dateFormatter(
    TextEditingController dayController,
    FocusNode monthFocusNodes,
    String hintText,
    String value,
  ) {
    var day = int.tryParse(value);
    dayValue = day;
    if (value.length == AppConstants.oneText && day != null) {
      if ((day > AppConstants.threeText)) {
        dayController.text = '0${dayController.text.substring(0, 1)}';
        dayController.selection = TextSelection.fromPosition(
            TextPosition(offset: dayController.text.length));
        monthFocusNodes.requestFocus();
      }
    }
    if (value.length == AppConstants.twoText && day != null) {
      if ((day > AppConstants.thirtyOneText)) {
        dayController.text = dayController.text.substring(0, 1);
        dayController.selection = TextSelection.fromPosition(
            TextPosition(offset: dayController.text.length));
        // monthFocusNodes.requestFocus();
      } else {
        monthFocusNodes.requestFocus();
      }
    }
  }

  static void monthFormatter(
    TextEditingController monthController,
    TextEditingController dayController,
    FocusNode yearFocusNodes,
    FocusNode dayFocusNodes,
    String hintText,
    String value,
  ) {
    // print(monthController.text.length);
    final month = int.tryParse(value);
    monthValue = month;
    if (value.length == AppConstants.oneText && month != null) {
      if (month > AppConstants.oneText) {
        monthController.text = '0${monthController.text.substring(0, 1)}';
        monthController.selection = TextSelection.fromPosition(
            TextPosition(offset: dayController.text.length));
        yearFocusNodes.requestFocus();
      }
    } else if (value.length == AppConstants.twoText && month != null) {
      if (month > AppConstants.twelveText) {
        monthController.text = monthController.text.substring(0, 1);
        monthController.selection = TextSelection.fromPosition(
            TextPosition(offset: monthController.text.length));
      } else if (value.length == AppConstants.twoText &&
          monthValue == AppConstants.zeroText) {
        monthController.selection =
            TextSelection.fromPosition(TextPosition(offset: value.length));
      } else {
        yearFocusNodes.requestFocus();
      }
    }
    if (value.isEmpty) {
      monthController.clear();
      dayFocusNodes.requestFocus();
      dayController.selection = TextSelection.fromPosition(
          TextPosition(offset: value.length + AppConstants.twoText));
    }
  }

  static void yearFormatter(
    TextEditingController yearController,
    TextEditingController monthController,
    FocusNode yearFocusNodes,
    FocusNode monthFocusNodes,
    String value,
  ) {
    final year = int.tryParse(value);
    // DateTime now = DateTime.now();
    // int currentYear = now.year;

    if (value.length == AppConstants.fourText && year != null) {
      if (value.length == AppConstants.fourText) {
        yearFocusNodes.unfocus();
      }
    } else if (value.isEmpty) {
      yearController.clear();
      monthFocusNodes.requestFocus();
      monthController.selection = TextSelection.fromPosition(
          TextPosition(offset: value.length + AppConstants.twoText));
    }
  }
}
