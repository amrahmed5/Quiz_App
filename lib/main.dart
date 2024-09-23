
import 'package:flutter/material.dart';
import 'finish.dart';
import 'question.dart';
import 'home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/guess': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String?;
          return guessMenu(playerName: args ?? "Player"); // Provide default if null
        },
        '/winner': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return Winner(
            playerName: args['playerName'],
            correctAnswers: args['correctAnswers'],
          );
        },

      },
    );
  }
}