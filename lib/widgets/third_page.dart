import 'package:flutter/material.dart';
import 'package:second_windows_project/models/question.dart';
import 'package:second_windows_project/widgets/custom_text.dart';
import 'package:second_windows_project/models/question.dart';
class ThirdPage extends StatefulWidget {
  static const tag = "third_page";
  @override
  State<ThirdPage> createState() => _MyThirdPageState();


}
class _MyThirdPageState extends State<ThirdPage> {
late Question question;

List<Question> listeQuestions = [
  Question("La devise de la Belgique est l'union fait la force", true, "C'est effectivement la devise", "belgique.jpg"),
  Question("La lune va finir par tomber sur la terreà cause de la gravité", false, "", "lune.jpg"),
  Question("Haddock est le nom du chien de Tintin", false, "Il s'agit de Milou", "tintin.jpg"),
];

int index = 0;
int score = 0;
@override
void initState(){
  super.initState();
  question = listeQuestions[index];
}

  @override
  Widget build(BuildContext context) {
  double taille = MediaQuery.of(context).size.width *0.75;
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Question 1", factor : 1.2),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText("Question numéro ${index+1}",color: Colors.grey[900],),
            CustomText("Score: $score / $index", color: Colors.grey[900],),
            Card(
              elevation: 10.0,
              child: Container(
                height: taille,
                width: taille,
                child: Image.asset("img/${question.imagePath}",),
                
              ),
            ),
            CustomText(question.question, color: Colors.grey[900], factor: 1.3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                boutonBool(true),
                boutonBool(false),
              ]

            )
          ],
        ),
      )
    );
  }
  ElevatedButton boutonBool (bool b){
  return ElevatedButton(
      onPressed: (()=>dialogue(b)),
      child: CustomText((b)?"Vrai": "Faux"),
  );
  }

  Future<Null> dialogue(bool b) async {
    bool bonneReponse = (b == question.reponse);
    String vrai = "img/quizz.jpg";
    String faux = "img/tintin.jpg";
    if (bonneReponse) {
      score++;
    }
    return showDialog(context: context, builder: (BuildContext context) {
      return new SimpleDialog(
        title: CustomText((bonneReponse) ? "C'est gagné!" : "Oups! perdu ..."),
        contentPadding: EdgeInsets.all(20.0),
        children: [
          Image.asset((bonneReponse) ? vrai : faux, fit: BoxFit.cover,),
          Container(
            height: 25.0,

          ),
          new CustomText(
            question.explication, factor: 1.25, color: Colors.grey[900],)
        ],
      );
    }
    );
  }

  }

