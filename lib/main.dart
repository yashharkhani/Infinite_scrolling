import 'package:flutter/material.dart';
import 'package:infinite_scrolling/src/config/app_manager.dart';
import 'package:infinite_scrolling/src/presentation/landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppManager().initStorage();

  runApp(const Landing());
}
