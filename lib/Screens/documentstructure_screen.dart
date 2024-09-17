import 'package:flutter/material.dart';
import 'package:learn_html_basic/Components/quizValidator.dart';
import 'package:learn_html_basic/Components/quizcomponent.dart';
import 'package:learn_html_basic/Screens/home_screen.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class DocumentstructureScreen extends StatefulWidget {
  const DocumentstructureScreen({super.key});

  @override
  _DocumentstructureScreenState createState() =>
      _DocumentstructureScreenState();
}

class _DocumentstructureScreenState extends State<DocumentstructureScreen> {
  final TextEditingController _nameController = TextEditingController();
  final List<String> _selectedAnswers = List.filled(3, '');

  void _validateAndProceed() {
    String? errorMessage = QuizValidator.validateForm(
      _nameController.text.trim(),
      _selectedAnswers,
    );

    if (errorMessage != null) {
      _showErrorDialog(errorMessage);
    } else {
      // Navigate to the next screen if validation passes
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const Homescreen()), // Replace with your next screen
      );
    }
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
        title: const Text('HTML Document Structure'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your existing content
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "HTML Document Structure",
                  ),
                  subtitle: const Text(
                    "An HTML document is composed of various elements that define its structure and content. Understanding the basic structure is crucial for creating well-formed web pages.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "<!DOCTYPE html>",
                  ),
                  subtitle: const Text(
                    "The <!DOCTYPE html> declaration defines the document type and version of HTML. It must be the very first thing in an HTML document, before the <html> tag. It ensures that the browser renders the page in standards mode, which is essential for consistent and correct display of web pages.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "<html> Tag",
                  ),
                  subtitle: const Text(
                    "The <html> tag is the root element of an HTML document. It wraps all the content of the page. Common attributes include 'lang' for specifying the language of the document.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "<head> Tag",
                  ),
                  subtitle: const Text(
                    "The <head> tag contains meta-information about the document. This can include the document's title, character set, styles, scripts, and other meta tags.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "<body> Tag",
                  ),
                  subtitle: const Text(
                    "The <body> tag contains all the visible content of the web page, such as text, images, links, tables, and more. Everything within the <body> tag is rendered on the browser window.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Complete HTML Document Example",
                    style: heading(),
                  ),
                  subtitle: const Text(
                    '''<!DOCTYPE html>
<html>
<head>
  <title>My First HTML Page</title>
</head>
<body>
  <h1>Welcome to My First HTML Page</h1>
  <p>This is a paragraph of text.</p>
</body>
</html>''',
                  ),
                ),
              ),
              const SizedBox(height: 20), // Adds space before the form
              // Quiz Section
              const Text(
                "Quiz Time!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              QuizComponent(
                question: "What does the <!DOCTYPE html> declaration do?",
                options: const [
                  "Defines the document type and version of HTML.",
                  "Sets the background color of the document.",
                  "Specifies the document's language.",
                  "None of the above"
                ],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[0] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question: "Which tag is the root element of an HTML document?",
                options: const ["<head>", "<body>", "<html>", "<title>"],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[1] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question: "What information can be included in the <head> tag?",
                options: const [
                  "Document title and meta information.",
                  "Visible content of the page.",
                  "Links and images.",
                  "Scripts and styles only."
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
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    minimumSize: WidgetStateProperty.all(const Size(
                        double.infinity, 50)), // Full width, 50 height
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Reduced radius
                      ),
                    ),
                  ),
                  onPressed: _validateAndProceed,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
