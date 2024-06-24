import 'package:flutter/material.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class DocumentstructureScreen extends StatelessWidget {
  const DocumentstructureScreen({Key? key}) : super(key: key);

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
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "HTML Document Structure",
                  ),
                  subtitle: Text(
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
                  subtitle: Text(
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
                  subtitle: Text(
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
                  subtitle: Text(
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
                  subtitle: Text(
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
            ],
          ),
        ),
      ),
    );
  }
}
