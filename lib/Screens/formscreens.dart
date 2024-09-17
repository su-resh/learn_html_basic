import 'package:flutter/material.dart';
import 'package:learn_html_basic/Components/quizValidator.dart';
import 'package:learn_html_basic/Components/quizcomponent.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
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
        title: const Text('HTML Forms'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Content Section
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Introduction to HTML Forms",
                  ),
                  subtitle: const Text(
                    "HTML forms are used to collect user input. Forms can include various elements like text fields, checkboxes, radio buttons, and submit buttons.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Basic Form Structure",
                  ),
                  subtitle: const Text(
                    '''A basic HTML form is created using the <form> tag. Inside this tag, you can use elements like <input>, <textarea>, <button>, and <select> to collect user data.\n\nExample:\n<form>\n  <label for="name">Name:</label>\n  <input type="text" id="name" name="name">\n  <input type="submit" value="Submit">\n</form>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Input Types - <input>",
                  ),
                  subtitle: const Text(
                    '''The <input> tag defines an input control. The type attribute specifies the type of input:\n- text: Single-line text field\n- password: Password field\n- checkbox: Checkbox\n- radio: Radio button\n- submit: Submit button\n\nExample:\n<input type="text" name="username">\n<input type="submit" value="Submit">''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Textarea - <textarea>",
                  ),
                  subtitle: const Text(
                    '''The <textarea> tag is used for multi-line text inputs.\n\nExample:\n<textarea name="message" rows="4" cols="50">\nEnter your message here...\n</textarea>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Select Menu - <select>",
                  ),
                  subtitle: const Text(
                    '''The <select> tag creates a drop-down list. Inside <select>, use <option> tags to define the options.\n\nExample:\n<select name="cars">\n  <option value="volvo">Volvo</option>\n  <option value="audi">Audi</option>\n  <option value="mercedes">Mercedes</option>\n</select>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Form Attributes",
                  ),
                  subtitle: const Text(
                    '''- action: URL where the form data will be sent.\n- method: HTTP method (GET or POST) to send form data.\n- enctype: Encoding type for form data (e.g., multipart/form-data for file uploads).''',
                  ),
                ),
              ),

              // Quiz Section
              const SizedBox(height: 20.0),
              const Text(
                "Quiz Time!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              QuizComponent(
                question: "Which tag is used to create an HTML form?",
                options: const ["<form>", "<input>", "<button>", "<textarea>"],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[0] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question:
                    "What attribute specifies where the form data will be sent?",
                options: const ["action", "method", "enctype", "name"],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[1] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question:
                    "What is the default method used for sending form data?",
                options: const ["GET", "POST", "PUT", "DELETE"],
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
