import 'package:flutter/material.dart';
import '/welcome_page.dart';
import '/login_register_page.dart';
import '/login_page.dart';
import '/register_page.dart';
import '/doctor_dashboard.dart';
import '/patient_dashboard.dart';
import '/payment_page.dart';
import '/payment_options_page.dart';
import '/health_tips_page.dart';
import 'accept_appointment_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Assistance Platform',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomePage(),
    );
  }
}
