import 'package:flutter/material.dart';
import 'package:learn_html_basic/Views/introduction.dart';

final List<Map<String, dynamic>> gridMap = [
  {
    "image": "assets/images/html.jpg",
    "title": "Introduction to HTML",
    "route": const IntroductionPage(),
  },
  {
    "image": "assets/images/html.jpg",
    "title": "HTML Document Structure",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "Tags And Elements",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "HTML Attributes",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "Headings And Paragraphs",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "HTML Text Formating",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "Lists",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "Links and Anchor Tags",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "Images",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "Tables",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "HTML Forms",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "Semantic Elements",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "HTML comments",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "HTML Entities",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "HTML Iframes",
  },
  {
    "image": "assets/images/html.jpg",
    "title": "Embeding Media",
  },
  {
    "image": "assets/images/html.jpg",
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
