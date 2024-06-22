import 'package:flutter/material.dart';
import 'package:learn_html_basic/Models/homeScreen_model.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Learn HTML'),
        ),
        body: GridB(),
      ),
    );
  }
}
