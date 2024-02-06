import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class VocabularyCarousel extends StatefulWidget {
  @override
  _VocabularyCarouselState createState() => _VocabularyCarouselState();
}

class _VocabularyCarouselState extends State<VocabularyCarousel> {
  List<VocabularyWord> words = [];

  @override
  void initState() {
    super.initState();
    loadWords();
  }

  Future<void> loadWords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if words are saved for the current date
    String currentDate = DateTime.now().toLocal().toString().split(' ')[0];
    String savedDate = prefs.getString('word_date') ?? '';

    if (currentDate != savedDate) {
      // If it's a new day, generate and save new words
      words = generateWords();
      prefs.setString('word_date', currentDate);
      prefs.setStringList(
        'words',
        words.map((word) => word.toJsonString()).toList(),
      );
    } else {
      // If not a new day, load saved words
      List<String> savedWords = prefs.getStringList('words') ?? [];
      words = savedWords
          .map((json) => VocabularyWord.fromJsonString(json))
          .toList();
    }

    setState(() {});
  }

  List<VocabularyWord> generateWords() {
    // Replace this with your logic to fetch new words for the day
    // For simplicity, using hardcoded values here
    return [
      VocabularyWord("Effervescent", "Bubbly and lively; showing high spirits.",
          "Her effervescent personality made everyone smile at the party."),
      VocabularyWord("Ephemeral", "Lasting for a very short time.",
          "The beauty of a rainbow is ephemeral, lasting only a few moments."),
      VocabularyWord(
          "Serendipity",
          "The occurrence and development of events by chance in a happy or beneficial way.",
          "Their meeting was pure serendipity, leading to a successful collaboration."),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Daily",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [
                          Color.fromRGBO(255, 33, 113, 1.0),
                          Color.fromRGBO(101, 40, 247, 1.0),
                        ],
                      ).createShader(bounds);
                    },
                    child: const Text(
                      " Challenges",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Center(
                child: Text(
                  " Learn and memorize  the words displayed in the flash cards .",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 218, 218, 218),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            CarouselSlider(
              items: words.map((word) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(33, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            word.word,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 24.0,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "Meaning: ${word.meaning}",
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Example: ${word.example}",
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VocabularyWord {
  String word;
  String meaning;
  String example;

  VocabularyWord(this.word, this.meaning, this.example);

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'meaning': meaning,
      'example': example,
    };
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  factory VocabularyWord.fromJson(Map<String, dynamic> json) {
    return VocabularyWord(json['word'], json['meaning'], json['example']);
  }

  factory VocabularyWord.fromJsonString(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return VocabularyWord(
        jsonMap['word'], jsonMap['meaning'], jsonMap['example']);
  }
}