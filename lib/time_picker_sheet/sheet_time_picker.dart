import 'package:flutter/material.dart';

abstract class SheetTimePicker extends StatelessWidget {
  const SheetTimePicker({Key? key}) : super(key: key);

  static Future<T?> show<T>({
    required BuildContext context,
    required SheetTimePicker sheet,
    bool dismissible = true,
    double roundedCorner = 8.0,
  }) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: dismissible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(roundedCorner),
      ),
      isDismissible: dismissible,
      builder: (_) {
        return sheet;
      },
    );
  }
}
