
class wordList{
  
  int id=0;
  String firstWord="";
  String secondWord="";
  String firstWordLanguage="";
  String secondWordLanguage="";
  String status="";
  int point=0;
  

  wordList(String firstWord,String secondWord,String firstWordLanguage,String secondWordLanguage,String status,int point){
     this.firstWord=firstWord;
     this.secondWord=secondWord;
     this.firstWordLanguage=firstWordLanguage;
     this.secondWordLanguage=secondWordLanguage;
     this.status=status;
     this.point=point;
  }
  //named constructor
  wordList.wordId(int id,String firstWord,String secondWord,String firstWordLanguage,String secondWordLanguage,String status,int point){
    this.id=id;
    this.firstWord=firstWord;
    this.secondWord=secondWord;
    this.firstWordLanguage=firstWordLanguage;
    this.secondWordLanguage=secondWordLanguage;
    this.status=status;
    this.point=point;
  }
}