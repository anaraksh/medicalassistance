import 'package:flutter/material.dart';
import 'doctor_dashboard.dart';
import 'patient_dashboard.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final ValueNotifier<String> userType = ValueNotifier<String>('Patient');
  String? generatedID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextField(
                controller: mobileController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              ValueListenableBuilder<String>(
                valueListenable: userType,
                builder: (context, value, child) {
                  return DropdownButton<String>(
                    value: value,
                    onChanged: (String? newValue) {
                      userType.value = newValue!;
                    },
                    items: <String>['Doctor', 'Patient']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                },
              ),
              if (userType.value == 'Doctor')
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text('Upload Credentials'),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Implement file upload functionality
                      },
                      child: Text('Upload File'),
                    ),
                  ],
                ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_validateInputs()) {
                    generatedID = generateID(userType.value);
                    if (userType.value == 'Doctor') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorDashboard()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientDashboard()),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill in all fields')),
                    );
                  }
                },
                child: Text('Register'),
              ),
              if (generatedID != null) Text('Generated ID: $generatedID'),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateInputs() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        usernameController.text.isNotEmpty;
  }

  String generateID(String userType) {
    return userType == 'Doctor' ? 'D-${DateTime.now().millisecondsSinceEpoch}' : 'P-${DateTime.now().millisecondsSinceEpoch}';
  }
}
