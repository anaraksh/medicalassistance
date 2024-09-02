import 'package:flutter/material.dart';

class AcceptAppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accept Appointments')),
      body: ListView.builder(
        itemCount: 5, // Assuming 5 patients for example
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Patient ${index + 1}'),
              subtitle: Text('Details about the appointment'),
              trailing: Wrap(
                spacing: 12,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Appointment accepted for Patient ${index + 1}'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text('Accept'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Appointment set to waiting for Patient ${index + 1}'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                    child: Text('Waiting'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Appointment rejected for Patient ${index + 1}'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: Text('Reject'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
