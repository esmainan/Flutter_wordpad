import 'package:flutter/material.dart';
import 'package:wordpad/screens/exercise.dart';
import 'package:wordpad/screens/wordpad.dart';
import '../models/wordList.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);
  List<wordList> wordLists = [wordList.wordId(0, "", "", "", "", "", 0)];
  HomeScreen(List<wordList> wordLists) {
    this.wordLists = wordLists;
  }
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selecetedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selecetedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wordpad"),
      ),
      body: PageView(
        children: [
          wordpad(widget.wordLists),
          const ExercisePage(),
          Container(color: Colors.yellow),
        ],
        controller: pageController,
        onPageChanged: (page) {
          setState(() {
            _selecetedIndex = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Exercise"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
        ],
        currentIndex: _selecetedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}
