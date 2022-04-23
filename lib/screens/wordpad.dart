import 'package:flutter/material.dart';
import 'package:wordpad/screens/word_add.dart';
import 'package:wordpad/screens/word_update.dart';
import '../models/wordList.dart';

class wordpad extends StatefulWidget {
  List<wordList> wordLists = [wordList.wordId(0, "", "", "", "", "", 0)];
  wordpad(List<wordList> wordLists) {
    this.wordLists = wordLists;
  }

  @override
  State<StatefulWidget> createState() {
    return _wordpadState();
  }
}

class _wordpadState extends State<wordpad> {
  int index2 = 0;
  wordList selectWord = wordList.wordId(0, "", "", "", "", "", 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.wordLists.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(widget.wordLists[index].firstWord +
                    " = " +
                    widget.wordLists[index].secondWord),
                subtitle: Text(widget.wordLists[index].firstWordLanguage +
                    " => " +
                    widget.wordLists[index].secondWordLanguage),
                leading: CircleAvatar(
                    backgroundImage:NetworkImage("https://e7.pngegg.com/pngimages/2/301/png-clipart-translation-computer-icons-english-google-translate-spanish-translate-blue-angle.png ")),
                //trailing: buildStatusIcon(widget.wordLists[index].point),//ne bu
                onTap: () {
                  setState(() {
                    selectWord = widget.wordLists[index];
                    index2 = index;
                  });
                },
                onLongPress: () {
                  print("uzunu basıldı");
                },
              );
            },
          ),
        ),
        Text("Seçilen Kelime : " + selectWord.firstWord),
        Row(
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.green,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Yeni Keime")
                    ],
                  ),
                  onPressed: () {
                    print("Yeni Kelime");
                    setState(() {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      word_add(widget.wordLists)))
                          .then((_) => setState(() {}));
                    });
                  },
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.yellow,
                  child: Row(
                    children: [
                      Icon(Icons.update),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Güncelle")
                    ],
                  ),
                  onPressed: () {
                    print("Güncelle");
                    setState(() {
                      if (index2 != -1)
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        word_update(widget.wordLists, index2)))
                            .then((_) => setState(() {}));
                      else
                        print("eleman yok");
                    });
                  },
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.red,
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Sil")
                    ],
                  ),
                  onPressed: () {
                    print("Sil");
                    setState(() {
                      widget.wordLists.remove(selectWord);
                      index2 = index2 - 1;
                    });
                  },
                )),
          ],
        )
      ],
    );
  }

  buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.alarm);
    } else {
      return Icon(Icons.clear);
    }
  }
}
