import 'package:flutter/material.dart';

class Winner extends StatelessWidget {
  final String playerName; // Holds the player's name
  final int correctAnswers; // Holds the number of correct answers

  const Winner({super.key, required this.playerName, required this.correctAnswers}); // Accept playerName and correctAnswers

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF86948F),
        body: Stack(
          children: [
            // Background container
            Positioned(
              top: 300,
              left: 60,
              child: Container(
                width: 350,
                height: 210,
                decoration: BoxDecoration(
                  color: Color(0xFFABBFB8),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // Text positioned inside the container
            Positioned(
              top: 330,
              left:88,
              child: Column(
                children: [
                  Text(
                    ' Hello $playerName Your score is !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '$correctAnswers/3.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Button positioned at the bottom of the container
            Positioned(
              top: 420,
              left: 190,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFB8E893),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  "Finish",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            // "Congratulations!" label at the top
            Align(
              alignment: Alignment(0, -0.28),
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFB8E893),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}