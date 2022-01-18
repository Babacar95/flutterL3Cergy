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
  Question("La devise de la Belgique est l'union fait la force", true, "L'union fait la force est la devise de la belgique depuis 1903", "belgique.jpg"),
  Question("La lune va finir par tomber sur la terre à cause de la gravité", false, "Rien ne prouve que la gravité fasse tomber la lune", "lune.jpg"),
  Question("Haddock est le nom du chien de Tintin", false, "C'est Milou et non Haddock le chien de Tintin", "tintin.jpg"),
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
    double taille = MediaQuery.of(context).size.width *0.75;
    bool bonneReponse = (b == question.reponse);
    String vrai = "img/succes.jpg";
    String faux = "img/error.jpg";
    if (bonneReponse) {
      score++;
    }
    return showDialog(context: context, builder: (BuildContext context) {
      return SimpleDialog(
        title: CustomText((bonneReponse) ? "C'est gagné!" : "Oups! perdu ..."),
        contentPadding: EdgeInsets.all(20.0),
        children: [
          Image.asset((bonneReponse) ? vrai : faux, fit: BoxFit.cover,height: taille,width: taille,),
          Container(height: 25.0,),
          CustomText(question.explication, factor: 1.25, color: Colors.grey[900],),
          Container(height: 25.0,),
          ElevatedButton(
            child: CustomText("Question suivante", factor: 1.25, color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
              questionSuivante();
            },
          ),
        ],
      );
    }
    );
  }


/**
 * Un (ou une) Future correspond à une tâche qui s'exécute de manière asynchrone
 * et se termine (ou échoue) à un moment donné dans le futur.
 * En effet on ne sait pas rééllement à quel moment l'utilisateur va fermer le
 * dialogue pour autant si l'application analyse d'autres informations nous voulons
 * que le programme puisse executer les tâches en parallèle.
 * Ici on veut créer une boîte de dialogue qui va vivre en parallèle on utilise
 * donc une fonction async
 * Voir définition différence entre Synchrone(cas nominal) et asynchrone ci-dessous:
 * Lorsque nous exécutons quelque chose de manière synchrone, nous attendons
 * qu’il se termine avant de passer à une autre tâche. Lorsque nous exécutons
 * quelque chose de manière asynchrone, vous pouvez passer à une autre tâche
 * avant la fin.
 */
Future<Null> alerte() async{
  return showDialog(
      context: context,
      barrierDismissible: false,//Permet d'empecher le dialog en cliquant sur la page en arrière plan
      builder: (BuildContext buildContext){
        return AlertDialog(
          title: CustomText("Le Quizz est terminé", color: Colors.blue,factor: 1.25,),
          contentPadding: EdgeInsets.all(10.0),
          content: CustomText("Votre score est de : $score / ${index+1} ", color: Colors.grey[900],),
          actions: [
            TextButton(
                onPressed: ((){
                  Navigator.pop(buildContext);//permet de kill en mémoire le AlertDialog
                  Navigator.pop(context);//permet de revenir sur la page précédente second_page
                }),
                child: CustomText("OK", factor: 1.25, color: Colors.grey[900],))
          ],
        );
      }
      );
  }


/**
 * Méthode qui va permettre de vérifier si l'ensemble des questions
 * à bien été traités et le cas échéant relancer la même page en changeant l'index
 * de la question.
 * Si toutes les questions ont été traités on appellera un nouveau AlertDialog
 * qui indiquera le score final du quizz
 */
void questionSuivante(){
    if(index + 1 < listeQuestions.length){
      index++;
      setState(() {
        question = listeQuestions[index];
      });
    }else{
      alerte();
    }
  }

  }

