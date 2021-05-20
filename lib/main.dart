import 'package:flutter/material.dart';
import 'file:///C:/Users/Mariem/AndroidStudioProjects/sh_project/lib/screens/DashboardTest.dart';

import 'screens/CustomDatabase.dart';
import 'screens/Dashboard.dart';

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
