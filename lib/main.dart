import 'package:flutter/material.dart';
import 'package:sh_project/DashboardTest.dart';

import 'CustomDatabase.dart';
import 'Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardTest(),
    );
  }
}
