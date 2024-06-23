import 'package:flutter/material.dart';

class ImportanceItem extends StatelessWidget {
  final String title;
  final String description;

  ImportanceItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(description),
        SizedBox(height: 8),
      ],
    );
  }
}
