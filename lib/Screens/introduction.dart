import 'package:flutter/material.dart';

import '../Models/historyitem.dart';
import '../Models/importanceitem.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

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
              Card(
                child: ListTile(
                  title: Text(
                    "What is HTML?",
                    style: header(),
                  ),
                  subtitle: Text(
                    "HTML (HyperText Markup Language) is the standard language used for creating and designing web pages. It serves as the backbone of web content, enabling the structuring and formatting of text, images, links, and other multimedia elements on the internet. HTML is a markup language, which means it uses tags to annotate content and give it meaning within the context of a web page.",
                    style: textbody(),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "History and Versions of HTML",
                    style: header(),
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
                    "Importance of HTML in Web Development",
                    style: header(),
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
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle header() =>
    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
TextStyle textbody() => const TextStyle(
    fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black);
