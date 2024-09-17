import 'package:flutter/material.dart';

class QuizComponent extends StatefulWidget {
  final String question;
  final List<String> options;
  final Function(String) onAnswerSelected;

  const QuizComponent({
    required this.question,
    required this.options,
    required this.onAnswerSelected,
    super.key,
  });

  @override
  _QuizComponentState createState() => _QuizComponentState();
}

class _QuizComponentState extends State<QuizComponent> {
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5.0),
            ...widget.options.map((option) => Row(
                  children: [
                    Radio<String>(
                      value: option,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value ?? '';
                        });
                        widget.onAnswerSelected(_selectedOption);
                      },
                    ),
                    Expanded(child: Text(option)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
