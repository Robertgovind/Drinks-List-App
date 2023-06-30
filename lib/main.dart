import 'package:drinks/homePage.dart';
import 'package:flutter/material.dart';

const Color bgColor = Color.fromARGB(255, 25, 8, 214);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drinks',
      theme: ThemeData(primaryColor: Colors.amberAccent),
      home: HomePage(),
    );
  }
}
