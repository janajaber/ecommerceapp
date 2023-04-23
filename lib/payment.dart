import 'package:flutter/services.dart'; // Add this import at the beginning of the file
import 'package:flutter/material.dart';
import 'models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ...

class PaymentPage extends StatefulWidget {
  final Cart cart;
  final double totalPrice;

  PaymentPage({required this.cart, required this.totalPrice});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cardHolderNameController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Visa Card Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Icon(
                FontAwesomeIcons.ccVisa,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 24),
              TextField(
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: '1234 5678 9012 3456',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _expiryDateController,
                keyboardType: TextInputType.datetime,
                cursorColor: Colors.black,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                decoration: InputDecoration(
                  labelText: 'Expiry Date',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'MMYY',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _cardHolderNameController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Card Holder Name',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'John Doe',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _cvvController,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'CVV',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: '123',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Container(
                width: MediaQuery.of(context).size.width *
                    0.6, // Adjust the width value as needed.
                //height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize
                      .min, // Add this line to make the row take minimum space horizontally.
                  children: [
                    Text(
                      'Total Price:',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '\$${widget.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle payment processing here
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text(
                    'Confirm Payment',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
