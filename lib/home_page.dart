
import 'package:flutter/material.dart';
import 'question.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController playerNameController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(children: [
          Align(
            alignment: Alignment(0, -.70),
            child: Text(
              'QUIZ',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          Align(
            alignment: Alignment(0, -.44),
            child: SizedBox(
              width: 200,
              height: 200,
              child: ClipOval(
                child: Image(

                  image: AssetImage('assets/Ellipse 1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300,
          ),
          Align(
            alignment: Alignment(0, 0.40),
            child: Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  color:Color(0xFFABBFB8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Please Enter Your Name',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(

                      controller: playerNameController,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFD9D9D9),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String name = playerNameController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => guessMenu(playerName: name),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFB8E893),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.05),
            child: Container(
              width: 200,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFFB8E893),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}