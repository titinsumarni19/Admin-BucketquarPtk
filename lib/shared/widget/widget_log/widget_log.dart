import 'package:flutter/material.dart';

extension StringWidgetLogExtension on String {
  Widget get w {
    return Text(
      "$this",
      style: TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}

extension IntWidgetLogExtension on int {
  Widget get w {
    return Text(
      "$this",
      style: TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}

extension DoubleWidgetLogExtension on double {
  Widget get w {
    return Text(
      "$this",
      style: TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}

extension ListWidgetLogExtension on List {
  Widget get w {
    return Text(
      "$this",
      style: TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}
