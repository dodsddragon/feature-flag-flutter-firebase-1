import 'package:flutter_feature_flag_1/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlutterFeatureFlagApp());
}

class FlutterFeatureFlagApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Dashboard());
  }
}
