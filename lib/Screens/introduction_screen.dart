import 'package:flutter/material.dart';
import 'package:learn_html_basic/Components/quizValidator.dart';
import 'package:learn_html_basic/Components/quizcomponent.dart';
import 'package:learn_html_basic/Models/historyitem.dart';
import 'package:learn_html_basic/Models/importanceitem.dart';
import 'package:learn_html_basic/Screens/home_screen.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
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
        title: const Text('Introduction to HTML'),
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
                    "What is HTML?",
                  ),
                  subtitle: const Text(
                    "HTML (HyperText Markup Language) is the standard language used for creating and designing web pages. It serves as the backbone of web content, enabling the structuring and formatting of text, images, links, and other multimedia elements on the internet. HTML is a markup language, which means it uses tags to annotate content and give it meaning within the context of a web page.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "History and Versions of HTML",
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HistoryItem(
                        year: "1991",
                        version: "HTML 1.0",
                        description:
                            "The original version created by Tim Berners-Lee, which included basic tags for text, links, and lists.",
                      ),
                      HistoryItem(
                        year: "1995",
                        version: "HTML 2.0",
                        description:
                            "The first standardized version by the Internet Engineering Task Force (IETF), introducing more complex features and elements.",
                      ),
                      HistoryItem(
                        year: "1997",
                        version: "HTML 3.2",
                        description:
                            "Standardized by the World Wide Web Consortium (W3C), adding support for tables, applets, and scripting languages like JavaScript.",
                      ),
                      HistoryItem(
                        year: "1999",
                        version: "HTML 4.01",
                        description:
                            "Introduced significant enhancements, including improved support for stylesheets, scripting, and multimedia elements.",
                      ),
                      HistoryItem(
                        year: "2000",
                        version: "XHTML",
                        description:
                            "A reformulation of HTML 4.01 in XML, emphasizing stricter syntax rules and compatibility with XML parsers.",
                      ),
                      HistoryItem(
                        year: "2014",
                        version: "HTML5",
                        description:
                            "The latest major version, adding new elements for multimedia (audio and video), enhanced support for interactive applications, and improved semantic structure. HTML5 also deprecated several older elements and attributes to promote cleaner, more efficient coding practices.",
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Importance of HTML in Web Development",
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImportanceItem(
                        title: "Structure",
                        description:
                            "It provides the basic structure of web pages, ensuring content is organized and presented logically.",
                      ),
                      ImportanceItem(
                        title: "Accessibility",
                        description:
                            "HTML elements and attributes enhance web accessibility, making content usable for people with disabilities.",
                      ),
                      ImportanceItem(
                        title: "SEO",
                        description:
                            "Proper use of HTML elements improves search engine optimization (SEO), helping web pages rank higher in search results.",
                      ),
                      ImportanceItem(
                        title: "Integration",
                        description:
                            "HTML integrates seamlessly with other web technologies like CSS and JavaScript, allowing for rich, interactive, and visually appealing web experiences.",
                      ),
                    ],
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
                question: "What does HTML stand for?",
                options: const [
                  "HyperText Markup Language",
                  "HyperText MultiLanguage",
                  "HyperText Makeup Language",
                  "Hypertext Markup List"
                ],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[0] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question:
                    "Which version of HTML introduced multimedia elements?",
                options: const ["HTML 1.0", "HTML 2.0", "HTML 4.01", "HTML5"],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[1] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question:
                    "What is the purpose of the 'title' attribute in HTML?",
                options: const [
                  "Adds a tooltip when hovering.",
                  "Defines the size of an element.",
                  "Specifies the URL for links.",
                  "Sets the color of text."
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
