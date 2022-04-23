import 'package:flutter/material.dart';
import 'package:wordpad/models/wordList.dart';
import 'package:wordpad/screens/login.dart';

void main() {
  runApp(MyApp());
}

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  List<wordList> wordLists = [];

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkBlue,
        ),
        debugShowCheckedModeBanner: false,
        home: login(KelimeListesi(wordLists)));
  }
}

KelimeListesi(List<wordList> wordLists) {
  return wordLists = [
    wordList.wordId(0, "Tahmin etmek", "Estimate", "Tr", "İng", "null", 0),
    wordList.wordId(1, "Ortaya çıkarmak", "Expose", "Tr", "İng", "null", 0),
    wordList.wordId(2, "Fatura", "Invoice", "Tr", "İng", "null", 0),
    wordList.wordId(3, "Tüketim", "Consumption", "Tr", "İng", "null", 0)
  ];
}
