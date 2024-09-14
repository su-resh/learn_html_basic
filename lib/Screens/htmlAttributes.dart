import 'package:flutter/material.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class HtmlAttributesScreen extends StatelessWidget {
  const HtmlAttributesScreen({super.key});

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
            ],
          ),
        ),
      ),
    );
  }
}
