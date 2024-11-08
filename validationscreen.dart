import 'package:flutter/material.dart';

class ValidationScreen extends StatefulWidget {
  @override
  _ValidationScreenState createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String cnic = '';
  String contactNumber = '';
  String address = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validation Form'),
        backgroundColor: const Color.fromARGB(255, 34, 100, 154),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Name should contain only alphabetic characters';
                  }
                  return null;
                },
                onSaved: (value) => name = value!,
              ),
              SizedBox(height: 16),


              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) => email = value!,
              ),
              SizedBox(height: 16),


              TextFormField(
                decoration: InputDecoration(labelText: 'CNIC (13 digits)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your CNIC';
                  }
                  if (!RegExp(r'^\d{13}$').hasMatch(value)) {
                    return 'CNIC should be exactly 13 digits';
                  }
                  return null;
                },
                onSaved: (value) => cnic = value!,
              ),
              SizedBox(height: 16),


              TextFormField(
                decoration: InputDecoration(labelText: 'Contact Number (11 digits)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                    return 'Contact number should be 11 digits';
                  }
                  return null;
                },
                onSaved: (value) => contactNumber = value!,
              ),
              SizedBox(height: 16),


              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onSaved: (value) => address = value!,
              ),
              SizedBox(height: 16),


              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password should be at least 8 characters';
                  }
                  if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
                    return 'Password must contain letters, numbers, and symbols';
                  }
                  return null;
                },
                onSaved: (value) => password = value!,
              ),
              SizedBox(height: 16),


              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    _formKey.currentState!.save();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form submitted successfully')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
