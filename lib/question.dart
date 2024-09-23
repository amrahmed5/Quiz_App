import 'package:flutter/material.dart';

class guessMenu extends StatefulWidget {
  final String playerName;

  const guessMenu({super.key, required this.playerName});

  @override
  _guessMenuState createState() => _guessMenuState();
}

class _guessMenuState extends State<guessMenu> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Who is the inventor of the light bulb?',
      'options': ['Thomas Edison', 'Albert Einstein', 'Ibn Sina', 'Nikola Tesla'],
      'answer': 'Thomas Edison',
    },
    {
      'question': 'How many states are there in the United States of America?',
      'options': ['51', '49', '50', '48'],
      'answer': '50',
    },
    {
      'question': 'Who won the English Premier League in 2023?',
      'options': ['Liverpool', 'Man City', 'Chelsea', 'Man United'],
      'answer': 'Man City',
    },
  ];

  int currentQuestionIndex = 0;
  String? selectedOption;
  int correctAnswers = 0; // Track correct answers

  void nextQuestion() {
    if (selectedOption == questions[currentQuestionIndex]['answer']) {
      correctAnswers++; // Increment if the answer is correct
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null; // Reset selected option for the next question
      });
    } else {
      // Navigate to the Winner page and pass playerName and correctAnswers
      Navigator.pushNamed(
        context,
        '/winner',
        arguments: {
          'playerName': widget.playerName,
          'correctAnswers': correctAnswers,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'QUIZ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(


          children: [
            SizedBox(height: 20),
            Image(image: AssetImage('assets/Ellipse 1.png')),
            SizedBox(height: 20),
            Container(
              width: 350,
              height: 430,
              decoration: BoxDecoration(
                color: Color(0xFFB8E893),
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${currentQuestionIndex + 1}/${questions.length}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    currentQuestion['question'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ...currentQuestion['options'].map<Widget>((option) {
                    bool isSelected = selectedOption == option;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = option;
                        });
                      },
                      child: Container(
                        width: 350,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.white,
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  Spacer(),
                  Center(
                    child: ElevatedButton(

                      onPressed: selectedOption != null ? nextQuestion : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF86948F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),

                        ),
                      ),
                      child: Text('Next',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}