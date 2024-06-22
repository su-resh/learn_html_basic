import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Introduction'),
        ),
        body: Column(
          children: [
            Column(
              children: [
                Text("data"),
                Text("data"),
                Container(
                  child: Text("data"),
                ),
                Container(
                  child: Text("data"),
                )
              ],
            )
          ],
        ));
  }
}
