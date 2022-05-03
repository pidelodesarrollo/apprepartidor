import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'warning': Icons.warning,
  'textsms': Icons.textsms,
  'touch_app': Icons.touch_app,
  'assignment': Icons.assignment,
};

Icon geticon(String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.lightGreen,
  );
}
