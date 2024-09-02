import 'package:flutter/material.dart';

class PaymentOptionsPage extends StatefulWidget {
  final String paymentMethod;

  PaymentOptionsPage({required this.paymentMethod});

  @override
  _PaymentOptionsPageState createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController upiIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Payment Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method: ${widget.paymentMethod}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Conditionally display different input fields based on the payment method
            if (widget.paymentMethod == 'GPay' ||
                widget.paymentMethod == 'PhonePe' ||
                widget.paymentMethod == 'UPI')
              _buildUPIPaymentFields()
            else if (widget.paymentMethod == 'NetBanking' ||
                widget.paymentMethod == 'Other Banking')
              _buildNetBankingFields()
            else
              _buildCreditCardFields(),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                _processPayment();
              },
              child: Text('Proceed to Pay'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUPIPaymentFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: upiIdController,
          decoration: InputDecoration(labelText: 'UPI ID'),
        ),
      ],
    );
  }

  Widget _buildNetBankingFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: upiIdController,
          decoration: InputDecoration(labelText: 'User ID'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
      ],
    );
  }

  Widget _buildCreditCardFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: cardNumberController,
          decoration: InputDecoration(labelText: 'Card Number'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20),
        TextField(
          controller: expiryDateController,
          decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
          keyboardType: TextInputType.datetime,
        ),
        SizedBox(height: 20),
        TextField(
          controller: cvvController,
          decoration: InputDecoration(labelText: 'CVV'),
          obscureText: true,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  void _processPayment() {
    // Handle payment processing logic here
    String paymentDetails;

    if (widget.paymentMethod == 'GPay' || widget.paymentMethod == 'PhonePe' || widget.paymentMethod == 'UPI') {
      paymentDetails = 'UPI ID: ${upiIdController.text}';
    } else if (widget.paymentMethod == 'NetBanking' || widget.paymentMethod == 'Other Banking') {
      paymentDetails = 'User ID: ${upiIdController.text}, Password: ${passwordController.text}';
    } else {
      paymentDetails =
          'Card Number: ${cardNumberController.text}, Expiry Date: ${expiryDateController.text}, CVV: ${cvvController.text}';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Payment Confirmation'),
        content: Text('Proceed with payment using ${widget.paymentMethod}?\n\nDetails: $paymentDetails'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement the payment processing logic here
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Payment Successful!')),
              );
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
