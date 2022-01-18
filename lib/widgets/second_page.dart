import 'package:flutter/material.dart';
import 'package:second_windows_project/widgets/custom_text.dart';
import 'package:second_windows_project/widgets/third_page.dart';


/**
 * Cette page va permettre de définir le point
 * d'entrée du Quizz. Soit la page d'accueil.
 */

class SecondPage extends StatefulWidget {
  static const tag = "second_page";

  @override
  State<SecondPage> createState() => _MySecondPageState();
}

/**
 * Permet de définir le State et donc le contenu
 * du Scafold de notre seconde page
 */
class _MySecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma seconde page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: Container(
                height: MediaQuery.of(context).size.width *0.8,
                width: MediaQuery.of(context).size.height *0.8,
                child: Image.asset("img/quizz.jpg", fit: BoxFit.cover,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
            ),
                onPressed: (){Navigator.of(context).pushNamed(ThirdPage.tag);},
              child: CustomText("Commencer le Quizz", factor: 1.5,),
            )
          ],
        ),
      ),
      backgroundColor: Colors.red,
    );
  }

}