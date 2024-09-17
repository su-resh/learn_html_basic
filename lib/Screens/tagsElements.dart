import 'package:flutter/material.dart';
import 'package:learn_html_basic/Components/quizValidator.dart';
import 'package:learn_html_basic/Components/quizcomponent.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class TagsElementsScreen extends StatefulWidget {
  const TagsElementsScreen({super.key});

  @override
  _TagsElementsScreenState createState() => _TagsElementsScreenState();
}

class _TagsElementsScreenState extends State<TagsElementsScreen> {
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
        title: const Text('HTML Tags and Elements'),
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
                    "HTML Elements",
                  ),
                  subtitle: const Text(
                    "HTML elements are the building blocks of web pages. They consist of a start tag, content, and an end tag.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "HTML Tags",
                  ),
                  subtitle: const Text(
                    "HTML tags are enclosed in angle brackets, like <tagname>. Most tags come in pairs: an opening tag and a closing tag.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Example of an HTML Element",
                  ),
                  subtitle: const Text(
                    '''<p>This is a paragraph.</p>\nIn this example:\n- <p> is the start tag.\n- "This is a paragraph." is the content.\n- </p> is the end tag.''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Self-Closing Tags",
                  ),
                  subtitle: const Text(
                    "Some HTML tags are self-closing and do not need an end tag, such as <img>, <br>, and <hr>.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Attributes in Tags",
                  ),
                  subtitle: const Text(
                    "HTML tags can have attributes that provide additional information. Common attributes include 'id', 'class', 'style', and 'src'.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Example of an HTML Tag with an Attribute",
                  ),
                  subtitle: const Text(
                    '''<a href="https://example.com">Visit Example</a>\nIn this example:\n- <a> is the tag.\n- href is the attribute specifying the link's destination.\n- "Visit Example" is the clickable text.''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Empty Elements",
                    style: heading(),
                  ),
                  subtitle: const Text(
                    "Elements like <img>, <br>, and <hr> are empty elements because they don't contain any content and don't require a closing tag.",
                  ),
                ),
              ),
              // Quiz Section
              const SizedBox(height: 20), // Adds space before the quiz
              const Text(
                "Quiz Time!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              QuizComponent(
                question: "What is an example of a self-closing tag?",
                options: const ["<p>", "<div>", "<img>", "<span>"],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[0] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question: "What does the 'href' attribute specify?",
                options: const [
                  "The ID of the element",
                  "The CSS class of the element",
                  "The URL for links",
                  "The size of the image"
                ],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[1] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question: "Which of the following is a valid HTML element?",
                options: const ["<html>", "<text>", "<field>", "<content>"],
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
