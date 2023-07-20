import 'package:flutter/material.dart';

import 'src/calendar_datetime_picker.dart';
import 'src/calendar_datetime_range_picker.dart';
import 'src/enum/calendar_type.dart';

Future<DateTime?> showCalendarDateTimePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  bool? is24HourMode,
  bool? isShowSeconds,
  int? minutesInterval,
  int? secondsInterval,
  bool? isForce2Digits,
  BorderRadiusGeometry? borderRadius,
  BoxConstraints? constraints,
  Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
      transitionBuilder,
  Duration? transitionDuration,
  bool? barrierDismissible,
  CalendarDateTimePickerType type = CalendarDateTimePickerType.dateAndTime,
  final bool Function(DateTime)? selectableDayPredicate,
  ThemeData? theme,
}) {
  return showGeneralDialog(
    context: context,
    transitionBuilder: transitionBuilder ??
        (context, anim1, anim2, child) {
          return FadeTransition(
            opacity: anim1.drive(
              Tween(
                begin: 0,
                end: 1,
              ),
            ),
            child: child,
          );
        },
    transitionDuration: transitionDuration ?? const Duration(milliseconds: 200),
    barrierDismissible: barrierDismissible ?? true,
    barrierLabel: 'CalendarDateTimePicker',
    pageBuilder: (BuildContext context, anim1, anim2) {
      return Theme(
        data: theme ?? Theme.of(context),
        child: CalendarDateTimePicker(
          type: type,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          is24HourMode: is24HourMode,
          isShowSeconds: isShowSeconds,
          minutesInterval: minutesInterval,
          secondsInterval: secondsInterval,
          isForce2Digits: isForce2Digits,
          borderRadius: borderRadius,
          constraints: constraints,
          selectableDayPredicate: selectableDayPredicate,
        ),
      );
    },
  );
}

Future<List<DateTime>?> showCalendarDateTimeRangePicker({
  required BuildContext context,
  DateTime? startInitialDate,
  DateTime? startFirstDate,
  DateTime? startLastDate,
  DateTime? endInitialDate,
  DateTime? endFirstDate,
  DateTime? endLastDate,
  bool? is24HourMode,
  bool? isShowSeconds,
  int? minutesInterval,
  int? secondsInterval,
  bool? isForce2Digits,
  BorderRadiusGeometry? borderRadius,
  BoxConstraints? constraints,
  Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
      transitionBuilder,
  Duration? transitionDuration,
  bool? barrierDismissible,
  CalendarDateTimePickerType type = CalendarDateTimePickerType.dateAndTime,
  bool Function(DateTime)? selectableDayPredicate,
  ThemeData? theme,
}) {
  return showGeneralDialog(
    context: context,
    transitionBuilder: transitionBuilder ??
        (context, anim1, anim2, child) {
          return FadeTransition(
            opacity: anim1.drive(
              Tween(
                begin: 0,
                end: 1,
              ),
            ),
            child: child,
          );
        },
    transitionDuration: transitionDuration ?? const Duration(milliseconds: 200),
    barrierDismissible: barrierDismissible ?? true,
    barrierLabel: 'CalendarDateTimeRangePicker',
    pageBuilder: (BuildContext context, anim1, anim2) {
      return Theme(
        data: theme ?? Theme.of(context),
        child: CalendarDateTimeRangePicker(
          type: type,
          startInitialDate: startInitialDate,
          startFirstDate: startFirstDate,
          startLastDate: startLastDate,
          endInitialDate: endInitialDate,
          endFirstDate: endFirstDate,
          endLastDate: endLastDate,
          is24HourMode: is24HourMode,
          isShowSeconds: isShowSeconds,
          minutesInterval: minutesInterval,
          secondsInterval: secondsInterval,
          isForce2Digits: isForce2Digits,
          borderRadius: borderRadius,
          constraints: constraints,
          selectableDayPredicate: selectableDayPredicate,
        ),
      );
    },
  );
}