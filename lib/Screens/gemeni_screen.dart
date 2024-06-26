import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';

const apiKey = "AIzaSyArjVH787j4uUfK7XpUEGCSZbp3QCnL2Uw";

class GemeniPage extends StatefulWidget {
  const GemeniPage({
    super.key,
  });

  @override
  State<GemeniPage> createState() => _GemeniPageState();
}

class _GemeniPageState extends State<GemeniPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 1, // Changed length to 1
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Google Gemini"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: "Text Only"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TextOnly(),
            // Remove TextWithImage() from here
          ],
        ),
      ),
    );
  }
}

// ------------------------------ Text Only ------------------------------

class TextOnly extends StatefulWidget {
  const TextOnly({
    super.key,
  });

  @override
  State<TextOnly> createState() => _TextOnlyState();
}

class _TextOnlyState extends State<TextOnly> {
  bool loading = false;
  List textChat = [];

  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  // Create Gemini Instance
  final gemini = GoogleGemini(
    apiKey: apiKey,
  );

  // Text only input
  void fromText({required String query}) {
    setState(() {
      loading = true;
      textChat.add({
        "role": "User",
        "text": query,
      });
      _textController.clear();
    });
    scrollToTheEnd();

    gemini.generateFromText(query).then((value) {
      setState(() {
        loading = false;
        textChat.add({
          "role": "Gemini",
          "text": value.text,
        });
      });
      scrollToTheEnd();
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
        textChat.add({
          "role": "Gemini",
          "text": error.toString(),
        });
      });
      scrollToTheEnd();
    });
  }

  void scrollToTheEnd() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: textChat.length,
              padding: const EdgeInsets.only(bottom: 20),
              itemBuilder: (context, index) {
                return ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    child: Text(textChat[index]["role"].substring(0, 1)),
                  ),
                  title: Text(textChat[index]["role"]),
                  subtitle: Text(textChat[index]["text"]),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.transparent,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                IconButton(
                  icon: loading
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.send),
                  onPressed: () {
                    fromText(query: _textController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
