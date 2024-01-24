import 'package:flutter/material.dart';

String formatTimeOfDay(TimeOfDay timeOfDay) {
  int hour = timeOfDay.hour;

  String amPm = 'AM';

  if (hour >= 12) {
    hour = hour % 12;
    amPm = "PM";
  }

  final minute = timeOfDay.minute;

  return '${hour == 0 ? 12 : hour}:$minute$amPm';
}
