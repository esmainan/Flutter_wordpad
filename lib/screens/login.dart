import 'package:flutter/material.dart';
import 'package:wordpad/screens/home.dart';
import '../models/wordList.dart';

class login extends StatefulWidget {
  List<wordList> wordLists = [wordList.wordId(0, "", "", "", "", "", 0)];
  login(List<wordList> wordLists) {
    this.wordLists = wordLists;
  }

  @override
  State<StatefulWidget> createState() {
    return _loginState();
  }
}

class _loginState extends State<login> {
  String username = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login Sayfası')),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 110.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: "Kullanıcı Adı",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 25.0),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Kullanıcı Adınızı Giriniz.";
                    } else
                      return null;
                  },
                  onSaved: (value) {
                    username = value.toString();
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (value) {
                    setState(() {
                      kontrol();
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: "Şifre",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 25.0),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == "")
                      return "Şifrenizi Giriniz.";
                    else
                      return null;
                  },
                  onSaved: (value) {
                    password = value.toString();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: Text(
                        "üye ol",
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    MaterialButton(
                      child: Text(
                        "Şifremi unuttum",
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 20.0),
                  child: Row(
                    children: [_loginButton()],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                )
              ],
            ),
          ),
        ));
  }
  Widget _loginButton() {
    return ElevatedButton(
      child: const Text("Giriş Yap",
        style: TextStyle(
          fontSize: 22.0,
        ),
      ),
      onPressed: () {
        kontrol();
      },
    );
  }

  void kontrol() {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();
    }
    if (username == "a" && password == "a") {
      debugPrint("giriş başarılı");
      Navigator.pushReplacement(
        //Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(widget.wordLists)),
      );
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Hata"),
              content: Text("Giriş Bilgileriniz Hatalı!"),
              actions: [
                MaterialButton(
                    child: Text("Geri Dön"),
                    onPressed: () {
                      return Navigator.pop(context);
                    })
              ],
            );
          });
    }
  }
}
