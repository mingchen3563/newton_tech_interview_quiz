import 'package:flutter/material.dart';
import 'package:newton_tech_interview_quiz/dependency_injection.dart';
import 'package:newton_tech_interview_quiz/presentation/app/test_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.inject();
  runApp(const TestApp());
}
