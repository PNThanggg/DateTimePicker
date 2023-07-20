import 'package:flutter/material.dart';

import 'app_log/app_log.dart';
import 'datetime_picker/datetime_picker.dart';

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
          ],
        ),
      ),
    );
  }
}
