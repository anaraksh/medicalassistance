import 'package:flutter/material.dart';
import 'doctor_dashboard.dart';
import 'patient_dashboard.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Doctor/Patient ID'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (idController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  if (idController.text.startsWith('D-')) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorDashboard()),
                    );
                  } else if (idController.text.startsWith('P-')) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientDashboard()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid ID')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              child: Text('Login and Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
