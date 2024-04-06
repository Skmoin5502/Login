import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for the form

  // Form fields data
  String _name = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form Page",
          style: TextStyle(color: Colors.green), // Set app bar title color to green
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 50, // Adjust the size of the circle avatar
              backgroundImage: AssetImage('assets/login3.jpg'), // Provide your image path here
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey, // Assigning the form key
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(color: Colors.green), // Set text color to green
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.green), // Set label text color to green
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green), // Set border color to green
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                    SizedBox(height: 16), // Add some space between fields
                    TextFormField(
                      style: TextStyle(color: Colors.green), // Set text color to green
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.green), // Set label text color to green
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green), // Set border color to green
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Basic email format validation
                        if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    SizedBox(height: 16), // Add some space between fields
                    SizedBox(
                      width: double.infinity, // Make button full width
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate form
                          if (_formKey.currentState!.validate()) {
                            // Save form data
                            _formKey.currentState!.save();
                            // You can now use _name and _email variables
                            // for further processing, e.g., submitting to a server
                            // For now, just print the data
                            print('Name: $_name');
                            print('Email: $_email');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          //primary: Colors.green, // Set button color to green
                          padding: EdgeInsets.symmetric(vertical: 15), // Button padding
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 18, color: Colors.black), // Set button text color to black
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Add some space between button and text field
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.green), // Set text color to green
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle the signup link tap
                            // You can navigate to signup screen or any other action here
                          },
                          child: Text(
                            'Signup',
                            style: TextStyle(
                              color: Colors.green, // Set link color to green
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}