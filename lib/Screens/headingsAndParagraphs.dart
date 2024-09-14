import 'package:flutter/material.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class HeadingsParagraphsScreen extends StatelessWidget {
  const HeadingsParagraphsScreen({super.key});

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
            ],
          ),
        ),
      ),
    );
  }
}
