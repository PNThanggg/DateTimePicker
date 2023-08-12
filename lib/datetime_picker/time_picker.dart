import 'package:flutter/material.dart';

import 'datetime_picker.dart';

class TimePicker {
  static Future<DateTime?> showTimePicker(
    BuildContext context, {
    bool showTitleActions = true,
    bool showSecondsColumn = true,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    locale = LocaleType.en,
    DateTime? currentTime,
        MyDatePickerTheme? theme,
  }) async {
    return await Navigator.push(
      context,
      DatePickerRoute(
        showTitleActions: showTitleActions,
        onChanged: onChanged,
        onConfirm: onConfirm,
        onCancel: onCancel,
        locale: locale,
        theme: theme,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        pickerModel: TimePickerModel(
          currentTime: currentTime,
          locale: locale,
          showSecondsColumn: showSecondsColumn,
        ),
      ),
    );
  }
}
