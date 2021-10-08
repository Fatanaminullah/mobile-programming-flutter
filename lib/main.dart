import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout App'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
  
}
