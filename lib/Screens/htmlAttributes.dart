import 'package:flutter/material.dart';
import 'package:learn_html_basic/Components/quizValidator.dart';
import 'package:learn_html_basic/Components/quizcomponent.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class HtmlAttributesScreen extends StatefulWidget {
  const HtmlAttributesScreen({super.key});

  @override
  _HtmlAttributesScreenState createState() => _HtmlAttributesScreenState();
}

class _HtmlAttributesScreenState extends State<HtmlAttributesScreen> {
  final TextEditingController _nameController = TextEditingController();
  final List<String> _selectedAnswers = List.filled(3, '');

  void _validateAndProceed() {
    String? errorMessage = QuizValidator.validateForm(
      _nameController.text.trim(),
      _selectedAnswers,
    );

    _showErrorDialog(errorMessage!);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTML Attributes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Existing content
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "What are HTML Attributes?",
                  ),
                  subtitle: const Text(
                    "HTML attributes provide additional information about elements. They are always placed in the opening tag and usually come in name/value pairs like name='value'.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Common HTML Attributes",
                  ),
                  subtitle: const Text(
                    '''1. id: Specifies a unique id for an element.\n2. class: Specifies one or more class names for an element.\n3. style: Adds inline CSS styles.\n4. href: Specifies the URL for links.\n5. src: Specifies the source file for images or media.''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Example of an Attribute",
                  ),
                  subtitle: const Text(
                    '''<img src="image.jpg" alt="Sample Image" width="500" height="600">\nIn this example:\n- src: Specifies the location of the image.\n- alt: Provides alternative text.\n- width & height: Define the size of the image.''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Multiple Attributes",
                  ),
                  subtitle: const Text(
                    "You can use multiple attributes in a single tag, separated by spaces. They must be defined within the opening tag.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Global Attributes",
                  ),
                  subtitle: const Text(
                    '''Some attributes are global and can be applied to any HTML element:\n1. title: Adds a tooltip when hovering.\n2. lang: Defines the language of the document or element.\n3. data-: Custom attributes used to store extra information.''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Custom Data Attributes",
                    style: heading(),
                  ),
                  subtitle: const Text(
                    "The data-* attribute allows you to store custom data on HTML elements. It can be used for data processing purposes in JavaScript.",
                  ),
                ),
              ),
              // Quiz Section
              const SizedBox(height: 20), // Adds space before the form
              const Text(
                "Quiz Time!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              QuizComponent(
                question:
                    "What does the 'src' attribute specify in an <img> tag?",
                options: const [
                  "The URL of the image.",
                  "The alternative text for the image.",
                  "The size of the image.",
                  "The type of the image."
                ],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[0] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question:
                    "Which attribute is used to define a unique identifier for an element?",
                options: const ["id", "class", "style", "href"],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[1] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question:
                    "What is the purpose of the 'data-*' attribute in HTML?",
                options: const [
                  "To store custom data.",
                  "To define the document's language.",
                  "To add a tooltip.",
                  "To specify the URL of a link."
                ],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[2] = selectedAnswer;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: _validateAndProceed,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  minimumSize: WidgetStateProperty.all(
                      const Size(double.infinity, 50)), // Full width, 50 height
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Reduced radius
                    ),
                  ),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
