import 'package:flutter/material.dart';

import 'app_log/app_log.dart';
import 'calendar_datetime/calendar_datetime_picker.dart';
import 'datetime_picker/datetime_picker.dart';
import 'time_picker_sheet/sheet.dart';
import 'time_picker_sheet/sheet_time_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTimeSelected = DateTime.now();

    void _openTimePickerSheet(BuildContext context) async {
      final result = await SheetTimePicker.show<DateTime?>(
        context: context,
        sheet: TimePickerSheet(
          sheetTitle: 'Select meeting schedule',
          minuteTitle: 'Minute',
          hourTitle: 'Hour',
          saveButtonText: 'Save',
        ),
      );

      if (result != null) {
        AppLog.info(dateTimeSelected);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Datetime Picker'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () {
                TimePicker.showTimePicker(
                  context,
                  showTitleActions: true,
                  onChanged: (date) {
                    AppLog.info('change $date in time zone ${date.timeZoneOffset.inHours}');
                  },
                  onConfirm: (date) {
                    AppLog.info('confirm $date');
                  },
                  currentTime: DateTime.now(),
                );
              },
              child: const Text(
                'show time picker',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                TimePicker.showTimePicker(
                  context,
                  showTitleActions: true,
                  showSecondsColumn: false,
                  onChanged: (date) {
                    AppLog.info('change $date in time zone ${date.timeZoneOffset.inHours}');
                  },
                  onConfirm: (date) {
                    AppLog.info('confirm $date');
                  },
                  currentTime: DateTime.now(),
                );
              },
              child: const Text(
                'show time picker(no second)',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                DatePicker.showDateTimePicker(
                  context,
                  showTitleActions: true,
                  onChanged: (date) {
                    AppLog.info('change $date in time zone ${date.timeZoneOffset.inHours}');
                  },
                  onConfirm: (date) {
                    AppLog.info('confirm $date');
                  },
                  currentTime: DateTime.now(),
                );
              },
              child: const Text(
                'show datetime picker',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                DatePicker.showPicker(
                  context,
                  showTitleActions: true,
                  onChanged: (date) {
                    AppLog.info('change $date in time zone ${date.timeZoneOffset.inHours}');
                  },
                  onConfirm: (date) {
                    AppLog.info('confirm $date');
                  },
                );
              },
              child: const Text(
                'show date picker',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                DateTime? dateTime = await showCalendarDateTimePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1600).subtract(const Duration(days: 3652)),
                  lastDate: DateTime.now().add(
                    const Duration(days: 3652),
                  ),
                  is24HourMode: false,
                  isShowSeconds: false,
                  minutesInterval: 1,
                  secondsInterval: 1,
                  isForce2Digits: true,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  constraints: const BoxConstraints(
                    maxWidth: 350,
                    maxHeight: 650,
                  ),
                  transitionBuilder: (context, anim1, anim2, child) {
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
                  transitionDuration: const Duration(milliseconds: 200),
                  barrierDismissible: true,
                  selectableDayPredicate: (dateTime) {
                    if (dateTime == DateTime(2023, 2, 25)) {
                      return false;
                    } else {
                      return true;
                    }
                  },
                );

                AppLog.info('change $dateTime');
              },
              child: const Text(
                'show calendar datetime picker',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                _openTimePickerSheet(context);
              },
              child: const Text(
                'show time picker sheet',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
