import 'package:flutter/material.dart';
import 'package:learn_html_basic/Themes/text_size.dart';

class TextFormattingScreen extends StatelessWidget {
  const TextFormattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTML Text Formatting'),
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
                    "HTML Text Formatting",
                  ),
                  subtitle: const Text(
                    "HTML provides various tags to format text, making it bold, italic, underlined, and more. These tags help style the content visually.",
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Bold Text - <b> and <strong>",
                  ),
                  subtitle: const Text(
                    '''The <b> tag makes the text bold without implying importance, whereas <strong> indicates that the text is important.\nExample:\n<b>This is bold text</b>\n<strong>This is strong text</strong>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Italic Text - <i> and <em>",
                  ),
                  subtitle: const Text(
                    '''The <i> tag displays text in italics for stylistic purposes. The <em> tag is used to emphasize text.\nExample:\n<i>This is italic text</i>\n<em>This is emphasized text</em>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Underlined Text - <u>",
                  ),
                  subtitle: const Text(
                    '''The <u> tag is used to underline text.\nExample:\n<u>This is underlined text</u>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Strikethrough Text - <s>",
                  ),
                  subtitle: const Text(
                    '''The <s> tag displays text with a strikethrough, indicating something that is no longer relevant or has been deleted.\nExample:\n<s>This is strikethrough text</s>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Subscript and Superscript - <sub> and <sup>",
                  ),
                  subtitle: const Text(
                    '''The <sub> tag is used for subscript text (e.g., chemical formulas), while <sup> is used for superscript text (e.g., exponents).\nExample:\nH<sub>2</sub>O (Water)\nE = mc<sup>2</sup>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    style: heading(),
                    "Monospace Text - <code>",
                  ),
                  subtitle: const Text(
                    '''The <code> tag is used to display text in a monospace font, commonly used for displaying code snippets.\nExample:\n<code>print('Hello, World!')</code>''',
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Quotation Tags - <q> and <blockquote>",
                    style: heading(),
                  ),
                  subtitle: const Text(
                    '''The <q> tag is used for short quotations, while <blockquote> is for longer quotes.\nExample:\n<q>This is a short quote</q>\n<blockquote>This is a longer block quote.</blockquote>''',
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
