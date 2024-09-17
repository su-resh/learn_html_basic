import 'package:flutter/material.dart';
import 'package:learn_html_basic/Components/quizValidator.dart';
import 'package:learn_html_basic/Components/quizcomponent.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class HeadingsParagraphsScreen extends StatefulWidget {
  const HeadingsParagraphsScreen({super.key});

  @override
  _HeadingsParagraphsScreenState createState() =>
      _HeadingsParagraphsScreenState();
}

class _HeadingsParagraphsScreenState extends State<HeadingsParagraphsScreen> {
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
        title: const Text('HTML Headings and Paragraphs'),
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
                    "HTML Headings",
                  ),
                  subtitle: const Text(
                    "Headings in HTML are used to define titles and subheadings on a web page. There are six levels of headings, from <h1> to <h6>, with <h1> being the most important.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Usage of Headings",
                  ),
                  subtitle: const Text(
                    '''<h1>Main Title</h1>\n<h2>Section Title</h2>\n<h3>Subsection Title</h3>\n\nHeadings help in organizing the content and improving accessibility and SEO by clearly defining the page structure.''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "HTML Paragraphs",
                  ),
                  subtitle: const Text(
                    "The <p> tag defines a paragraph in HTML. It automatically adds space before and after the paragraph, making the content more readable.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Example of a Paragraph",
                  ),
                  subtitle: const Text(
                    '''<p>This is a paragraph of text in HTML. It is used to structure blocks of text on a web page.</p>\nIn this example, the <p> tag surrounds a block of text, indicating it's a paragraph.''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Using Multiple Paragraphs",
                  ),
                  subtitle: const Text(
                    "You can add multiple <p> tags to separate different sections of text.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Line Breaks within Paragraphs",
                    style: heading(),
                  ),
                  subtitle: const Text(
                    "To create a line break within a paragraph without starting a new one, use the <br> tag.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Example of Line Break",
                    style: heading(),
                  ),
                  subtitle: const Text(
                    '''<p>This is the first line.<br>This is the second line.</p>\nThe <br> tag adds a line break inside a paragraph.''',
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
                question: "What is the purpose of the <h1> tag?",
                options: const [
                  "Defines the main heading of the document.",
                  "Creates a line break.",
                  "Defines a paragraph.",
                  "Specifies the document's title."
                ],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[0] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question: "How do you create a line break in HTML?",
                options: const [
                  "Use the <br> tag.",
                  "Use the <p> tag.",
                  "Use the <hr> tag.",
                  "Use the <b> tag."
                ],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[1] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question: "What does the <p> tag represent in HTML?",
                options: const [
                  "A paragraph.",
                  "A heading.",
                  "A line break.",
                  "A division."
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
