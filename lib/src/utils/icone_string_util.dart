import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
};

final _iconFinal = <String, IconData>{'right': Icons.keyboard_arrow_right};

Icon getIcon(String nomeIcone) {
  return Icon(
    _icons[nomeIcone],
    color: Colors.blue,
  );
}
