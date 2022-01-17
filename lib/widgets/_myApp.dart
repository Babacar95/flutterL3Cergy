import 'package:flutter/material.dart';
import 'package:second_windows_project/widgets/_myHomePage.dart';
import 'package:second_windows_project/widgets/second_page.dart';
import 'package:second_windows_project/widgets/third_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {SecondPage.tag : (context)=>SecondPage(), ThirdPage.tag : (context)=>ThirdPage()},
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}