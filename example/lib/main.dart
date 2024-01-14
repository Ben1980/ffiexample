import 'package:ffigen_app/ffigen_app.dart';
import 'package:flutter/material.dart';

const String jsCode = '1+2';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Test test;

  @override
  void initState() {
    super.initState();
    test = Test();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(test.string),
        ),
      ),
    );
  }
}
