import 'dart:io';
import 'dart:math';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    // Loop to allow multiple players
    while (true) {
      stdout.write("Your name: ");
      String? playerName = stdin.readLineSync();

      // Exit if no name is provided
      if (playerName == null || playerName.trim().isEmpty) {
        break;
      }

      // Add players to the quiz
      Player currentPlayer = Player(name: playerName);
      quiz.addPlayer(currentPlayer);

      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.point} points))');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          currentPlayer.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }

      // Calculate score and points for players
      currentPlayer.score = quiz.getScoreInPercentage(currentPlayer.answers);
      currentPlayer.point = quiz.getPoint(currentPlayer.answers);

      print("${currentPlayer.name}, your score in percentage: ${currentPlayer.score} %");
      print("${currentPlayer.name}, your score in points: ${currentPlayer.point}");

      // Display all players scores
      for (var player in quiz.players) {
        print("Player: ${player.name}\t\tScore:${player.score}");
      }
    }

    print('--- Quiz Finished ---');
  }
}
 