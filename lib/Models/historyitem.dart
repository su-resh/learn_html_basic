import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final String year;
  final String version;
  final String description;

  HistoryItem(
      {required this.year, required this.version, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$year - $version",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(description),
        SizedBox(height: 8),
      ],
    );
  }
}
