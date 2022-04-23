import 'package:flutter/material.dart';
import '../models/wordList.dart';

class word_update extends StatefulWidget {
  int index2 = 0;
  List<wordList> wordLists = [wordList.wordId(0, "", "", "", "", "", 0)];
  word_update(List<wordList> wordLists, int index2) {
    this.wordLists = wordLists;
    this.index2 = index2;
  }

  @override
  State<StatefulWidget> createState() {
    return _wordUpdateState();
  }
}

class _wordUpdateState extends State<word_update> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    wordList wordLists2 = wordList.wordId(0, "", "", "", "", "", 0);
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
      decoration:
          InputDecoration(labelText: widget.wordLists[widget.index2].firstWord),
      onSaved: (value) {
        if (value.toString().isEmpty) {
          wordLists2.firstWord = widget.wordLists[widget.index2].firstWord;
        } else {
          wordLists2.firstWord = value.toString();
        }
      },
    );
  }

  Widget buildLastNameField(wordList wordLists2) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: widget.wordLists[widget.index2].secondWord),
      onSaved: (value) {
        if (value.toString().isEmpty) {
          wordLists2.secondWord = widget.wordLists[widget.index2].secondWord;
        } else {
          wordLists2.secondWord = value.toString();
        }
      },
    );
  }

  Widget buildGradeField(wordList wordLists2) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: widget.wordLists[widget.index2].status.toString(),
          hintText: "True - False"),
      onSaved: (value) {
        if (value.toString().isEmpty) {
          wordLists2.status = widget.wordLists[widget.index2].status;
        } else {
          wordLists2.status = value.toString();
        }
      },
    );
  }

  Widget buildSubmitButton(var formKey, wordList wordLists2) {
    return RaisedButton(
        child: Text("Kaydet"),
        onPressed: () {
          formKey.currentState.save();
          wordLists2.firstWordLanguage = "Tr";
          wordLists2.secondWordLanguage = "İng";
          wordLists2.point = 0;
          widget.wordLists[widget.index2] = wordLists2;
          print(widget.index2);
          Navigator.pop(context);
        });
  }
}
