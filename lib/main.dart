import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/src/internal/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}
