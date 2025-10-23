 import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_repository.dart';

void main() {

  // List<Question> questions = [
  //   Question(
  //       title: "Capital of France?",
  //       choices: ["Paris", "London", "Rome"],
  //       goodChoice: "Paris",
  //       ),
        
  //   Question(
  //       title: "2 + 2 = ?", 
  //       choices: ["2", "4", "5"], 
  //       goodChoice: "4",
  //       point: 50),
  // ];

  // Read quiz from JSON file
  QuizRepository repository = QuizRepository('quiz.json');
  Quiz quiz = repository.readQuiz();

  QuizConsole console = QuizConsole(quiz: quiz);
  console.startQuiz();

  QuizRepository resultsRepo = QuizRepository('quiz_result.json');
  resultsRepo.writeQuiz(quiz);
}
