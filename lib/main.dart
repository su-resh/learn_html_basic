import 'package:flutter/material.dart';
import 'package:learn_html_basic/Screens/home_screen.dart';

class learn_html extends StatelessWidget {
  const learn_html({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Learn HTML Basic",
      home: Homescreen(),
    );
  }
}

void main() {
  runApp(const learn_html());
}
