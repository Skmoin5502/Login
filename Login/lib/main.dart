import 'package:flutter/material.dart';
import 'package:login/form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     //kuch hua nhi isse  color waaley se
      primarySwatch: Colors.indigo, // Use Colors.indigo for indigo color
      ),
      home: FormScreen(),
    );
  }
}
