import 'package:flutter/material.dart';
import 'package:todoapp/mainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: MainScreen()
      //Text(// (marks >= 40) ? "PASS" : "FAIL",
        // style: TextStyle(color: (marks>=40) ? Colors.green : Colors.amber)), //dấu ? là then giống của if, : giống của else nghĩa là otherwise
      
    );
  }
}
