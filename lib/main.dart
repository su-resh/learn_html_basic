import 'package:flutter/material.dart';
import 'package:learn_html_basic/Views/homeScreen.dart';

class learn_html extends StatelessWidget {
  const learn_html({super.key});

  @override
  Widget build(BuildContext context) {
    return Homescreen();
  }
}

void main() {
  runApp(const learn_html());
}
