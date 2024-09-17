import 'package:flutter/material.dart';
import 'package:learn_html_basic/Components/quizValidator.dart';
import 'package:learn_html_basic/Components/quizcomponent.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
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
        title: const Text('HTML Tables'),
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
                    "Introduction to HTML Tables",
                  ),
                  subtitle: const Text(
                    "HTML tables are used to display data in a tabular format. Tables consist of rows and columns, with each cell containing data.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Basic Table Structure",
                  ),
                  subtitle: const Text(
                    '''A basic HTML table is defined using the <table> tag. Inside this tag, you use <tr> for table rows, <th> for table headers, and <td> for table data.\n\nExample:\n<table>\n  <tr>\n    <th>Header 1</th>\n    <th>Header 2</th>\n  </tr>\n  <tr>\n    <td>Data 1</td>\n    <td>Data 2</td>\n  </tr>\n</table>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Table Headers - <th>",
                  ),
                  subtitle: const Text(
                    '''The <th> tag defines a header cell in a table. It is bold and centered by default.\n\nExample:\n<table>\n  <tr>\n    <th>Header 1</th>\n    <th>Header 2</th>\n  </tr>\n  <tr>\n    <td>Data 1</td>\n    <td>Data 2</td>\n  </tr>\n</table>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Table Data - <td>",
                  ),
                  subtitle: const Text(
                    '''The <td> tag defines a standard cell in a table. It is used inside <tr> tags to represent table data.\n\nExample:\n<table>\n  <tr>\n    <td>Data 1</td>\n    <td>Data 2</td>\n  </tr>\n</table>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Table Row - <tr>",
                  ),
                  subtitle: const Text(
                    '''The <tr> tag defines a row in a table. It is used to group header or data cells.\n\nExample:\n<table>\n  <tr>\n    <td>Data 1</td>\n    <td>Data 2</td>\n  </tr>\n</table>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Table Attributes",
                  ),
                  subtitle: const Text(
                    '''You can use attributes to enhance tables:\n- <table border="1">: Adds a border around the table.\n- <caption>: Adds a title to the table.\n- <colspan>: Specifies how many columns a cell should span.\n- <rowspan>: Specifies how many rows a cell should span.''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Example of a Table with Attributes",
                    style: heading(),
                  ),
                  subtitle: const Text(
                    '''<table border="1">\n  <caption>Sample Table</caption>\n  <tr>\n    <th>Header 1</th>\n    <th>Header 2</th>\n  </tr>\n  <tr>\n    <td colspan="2">Merged Cell</td>\n  </tr>\n  <tr>\n    <td>Data 1</td>\n    <td>Data 2</td>\n  </tr>\n</table>''',
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
                question: "Which tag is used to define a table in HTML?",
                options: const ["<table>", "<tr>", "<td>", "<th>"],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[0] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question: "What is the purpose of the <th> tag?",
                options: const [
                  "Defines a table cell",
                  "Defines a table header cell",
                  "Defines a table row",
                  "Defines a table caption"
                ],
                onAnswerSelected: (selectedAnswer) {
                  setState(() {
                    _selectedAnswers[1] = selectedAnswer;
                  });
                },
              ),
              QuizComponent(
                question: "How do you specify a border for a table?",
                options: const [
                  '<table border="1">',
                  '<table width="1">',
                  '<table cellpadding="1">',
                  '<table cellspacing="1">'
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
