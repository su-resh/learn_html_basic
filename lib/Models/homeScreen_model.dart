import 'package:flutter/material.dart';
import 'package:learn_html_basic/Screens/documentstructure_screen.dart';
import 'package:learn_html_basic/Screens/formscreens.dart';
import 'package:learn_html_basic/Screens/headingsAndParagraphs.dart';
import 'package:learn_html_basic/Screens/htmlAttributes.dart';
import 'package:learn_html_basic/Screens/tables.dart';
import 'package:learn_html_basic/Screens/tagsElements.dart';
import 'package:learn_html_basic/Screens/textFormatting.dart';

import '../Screens/introduction_screen.dart';

final List<Map<String, dynamic>> gridMap = [
  {
    "image": "assets/images/introduction.png",
    "title": "Introduction to HTML",
    "route": const IntroductionScreen(),
  },
  {
    "image": "assets/images/documentstructure.png",
    "title": "HTML Document Structure",
    "route": const DocumentstructureScreen(),
  },
  {
    "image": "assets/images/htmltags.png",
    "title": "Tags And Elements",
    "route": const TagsElementsScreen(),
  },
  {
    "image": "assets/images/attribute.png",
    "title": "HTML Attributes",
    "route": const HtmlAttributesScreen(),
  },
  {
    "image": "assets/images/heading.png",
    "title": "Headings And Paragraphs",
    "route": const HeadingsParagraphsScreen(),
  },
  {
    "image": "assets/images/textformat.png",
    "title": "HTML Text Formating",
    "route": const TextFormattingScreen(),
  },
  {
    "image": "assets/images/link.png",
    "title": "Links and Anchor Tags",
    "route": const TagsElementsScreen(),
  },
  {
    "image": "assets/images/introduction.png",
    "title": "Tables",
    "route": const TableScreen()
  },
  {
    "image": "assets/images/introduction.png",
    "title": "Forms",
    "route": const FormScreen()
  },
  {
    "image": "assets/images/introduction.png",
    "title": "Certificates",
  }
];

class GridB extends StatefulWidget {
  const GridB({super.key});

  @override
  State<GridB> createState() => GridBState();
}

class GridBState extends State<GridB> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              if (gridMap[index]["route"] != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => gridMap[index]["route"]),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(5, 5),
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    gridMap[index]["image"],
                    height: 80, // Reduced height to fit within constraints
                    width: 80,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Text(
                            gridMap[index]["title"],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11), // Adjust font size
                          ),
                        ),
                        const Icon(
                          Icons.lock,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
