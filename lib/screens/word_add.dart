import 'package:flutter/material.dart';
import 'package:wordpad/models/wordList.dart';

class word_add extends StatefulWidget {
  List<wordList> wordLists = [wordList.wordId(0, "", "", "", "", "", 0)];
  word_add(List<wordList> wordLists) {
    this.wordLists = wordLists;
  }

  @override
  State<StatefulWidget> createState() {
    return _wordAddState();
  }
}

class _wordAddState extends State<word_add> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    wordList wordLists2 = new wordList.wordId(0, "", "", "", "", "", 0);
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Ögrenci ekle"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildFirstNameField(wordLists2),
                buildLastNameField(wordLists2),
                buildGradeField(wordLists2),
                buildSubmitButton(formKey, wordLists2)
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameField(wordList wordLists2) {
    return TextFormField(
      decoration: InputDecoration(labelText: "Kelime", hintText: "Tr"),
      onSaved: (value) {
        wordLists2.firstWord = value.toString();
      },
    );
  }

  Widget buildLastNameField(wordList wordLists2) {
    return TextFormField(
      decoration: InputDecoration(labelText: "Karşılığı", hintText: "İng"),
      onSaved: (value) {
        wordLists2.secondWord = value.toString();
      },
    );
  }

  Widget buildGradeField(wordList wordLists2) {
    return TextFormField(
      decoration: InputDecoration(labelText: "Durum", hintText: "True - False"),
      onSaved: (value) {
        wordLists2.status = value.toString();
      },
    );
  }

  Widget buildSubmitButton(var formKey, wordList wordLists2) {
    return RaisedButton(
        child: Text("Kaydet"),
        onPressed: () {
          formKey.currentState.save();
          wordLists2.id = widget.wordLists.length;
          wordLists2.firstWordLanguage = "Tr";
          wordLists2.secondWordLanguage = "İng";
          wordLists2.point = 0;
          widget.wordLists.add(wordLists2);
          Navigator.pop(context);
        });
  }
}
