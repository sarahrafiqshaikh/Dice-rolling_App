import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dice1Image = "assets/dice1.png";
  String dice2Image = "assets/dice1.png";
  int count = 0;
  int score = 0;

  void rollDice() {
    int randomNumber_1 = Random().nextInt(6) + 1;
    int randomNumber_2 = Random().nextInt(6) + 1;
    setState(() {
      dice1Image = "assets/dice$randomNumber_1.png";
      dice2Image = "assets/dice$randomNumber_2.png";
      count++;
      if ((randomNumber_1 == 1 && randomNumber_2 == 1) ||
          (randomNumber_1 == 6 && randomNumber_2 == 6)) {
        score += 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 232, 71, 76),
        title: Text("Dice Roll Project",
          style: TextStyle(fontSize: 27),
        ),
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Center(
              child: Text(
                "Score: $score",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(dice1Image, height: 130, width: 130),
            Image.asset(dice2Image, height: 130, width: 130),
          ],
        ),
        ElevatedButton(
          onPressed: count >= 10 ? null : rollDice,
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 232, 71, 76),
          ),
          child: Text(
            "Roll Dice",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
