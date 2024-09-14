import 'package:flutter/material.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class tagsElementsScreen extends StatelessWidget {
  const tagsElementsScreen({super.key});

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
            ],
          ),
        ),
      ),
    );
  }
}
