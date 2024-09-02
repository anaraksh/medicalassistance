import 'package:flutter/material.dart';

class BookDoctorPage extends StatelessWidget {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ValueNotifier<String> specialist = ValueNotifier<String>('General Physician');
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Doctor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Book a Doctor Appointment',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 30),

            // Dropdown for selecting specialist
            DropdownButtonFormField<String>(
              value: specialist.value,
              decoration: InputDecoration(labelText: 'Specialist'),
              onChanged: (String? newValue) {
                specialist.value = newValue!;
              },
              items: <String>[
                'General Physician', 
                'Dentist', 
                'Cardiologist',
                'Neurologist',
                'Gynecologist',
                'Paediatrician',
                'Nephrologist',
                'Orthopedist'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Dropdown for selecting location
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Location'),
              items: <String>[
                'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh', 
                'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 
                'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 
                'Manipur', 'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 
                'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu', 
                'Telangana', 'Tripura', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                locationController.text = value!;
              },
            ),

            SizedBox(height: 20),

            // TextField for describing the issue
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Describe Your Issue'),
              maxLines: 3,
            ),

            SizedBox(height: 20),

            // Buttons for selecting date and time
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (selectedDate != null) {
                        this.selectedDate = selectedDate;
                      }
                    },
                    child: Text('Select Date'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        this.selectedTime = selectedTime;
                      }
                    },
                    child: Text('Select Time'),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Display selected date and time
            if (selectedDate != null)
              Text('Selected Date: ${selectedDate!.toLocal().toString().split(' ')[0]}'),
            if (selectedTime != null)
              Text('Selected Time: ${selectedTime!.format(context)}'),

            SizedBox(height: 30),

            // Button for booking appointment
            ElevatedButton(
              onPressed: () {
                if (_validateInputs()) {
                  _showConfirmationDialog(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInputs() {
    return locationController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        selectedDate != null &&
        selectedTime != null;
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Appointment Booked'),
          content: Text(
              'Your appointment with a ${specialist.value} has been booked for ${selectedDate!.toLocal().toString().split(' ')[0]} at ${selectedTime!.format(context)}.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
