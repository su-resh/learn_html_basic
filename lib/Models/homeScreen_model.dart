import 'package:flutter/material.dart';
import 'package:learn_html_basic/Screens/documentStructureScreen.dart';

import '../Screens/introduction.dart';

final List<Map<String, dynamic>> gridMap = [
  {
    "image": "assets/images/introduction.png",
    "title": "Introduction to HTML",
    "route": IntroductionScreen(),
  },
  {
    "image": "assets/images/documentstructure.png",
    "title": "HTML Document Structure",
    "route": Documentstructurescreen(),
  },
  {
    "image": "assets/images/htmltags.png",
    "title": "Tags And Elements",
  },
  {
    "image": "assets/images/attribute.png",
    "title": "HTML Attributes",
  },
  {
    "image": "assets/images/heading.png",
    "title": "Headings And Paragraphs",
  },
  {
    "image": "assets/images/textformat.png",
    "title": "HTML Text Formating",
  },
  {
    "image": "assets/images/list.png",
    "title": "Lists",
  },
  {
    "image": "assets/images/link.png",
    "title": "Links and Anchor Tags",
  },
  {
    "image": "assets/images/introduction.png",
    "title": "Images",
  },
  {
    "image": "assets/images/introduction.png",
    "title": "Tables",
  },
  {
    "image": "assets/images/introduction.png",
    "title": "HTML Forms",
  },
  {
    "image": "assets/images/introduction.png",
    "title": "Semantic Elements",
  },
  {
    "image": "assets/images/introduction.png",
    "title": "HTML comments",
  },
  {
    "image": "assets/images/introduction.png",
    "title": "HTML Entities",
  },
  {
    "image": "assets/images/introduction.png",
    "title": "HTML Iframes",
  },
  {
    "image": "assets/images/introduction.png",
    "title": "Embeding Media",
  },
  {
    "image": "assets/images/introduction.png",
    "title": "Certificates",
  },
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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => gridMap[index]["route"]),
              );
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
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    gridMap[index]["title"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),
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
