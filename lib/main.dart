import 'package:carbon_emission_calculator/core/di/app_bindings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';

Future<void> main() async {
  AppBindings().dependencies();
  runApp(const MyApp());
}
