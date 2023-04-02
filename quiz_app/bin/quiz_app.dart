import 'dart:io';

// Define a Question class with a question, answer, and points
class Question {
  String question;
  String answer;
  int points;

  Question(this.question, this.answer, this.points);
}

// Define a Quiz class with a list of questions and a score
class Quiz {
  List<Question> questions;
  int score = 0;

  Quiz(this.questions);

  // Display the current question to the user
  void askQuestion(int index) {
    print('Question ${index + 1}: ${questions[index].question}');
  }

  // Check if the user's answer is correct and update the score if necessary
  void checkAnswer(int index, String answer) {
    if (answer.toLowerCase() == questions[index].answer.toLowerCase()) {
      print('Correct!');
      score += questions[index].points;
    } else {
      print('Incorrect!');
    }
  }

  // Display the final score to the user
  void showScore() {
    print('Your final score is: $score');
  }
}

void main() {
  // Define some questions for the quiz
  var question1 = Question('What is the capital of France?', 'Paris', 10);
  var question2 = Question('What is the tallest mountain in the world?', 'Mount Everest', 10);
  var question3 = Question('What is the largest country in the world by area?', 'Russia', 10);

  // Add the questions to the quiz
  var quiz = Quiz([question1, question2, question3]);

  // Display a welcome message
  print('Welcome to the Quiz!');

  // Ask the user if they're ready to start
  stdout.write('Are you ready to start? (y/n) ');
  var ready = stdin.readLineSync()?.toLowerCase() == 'y';

  // If the user is ready, start the quiz
  if (ready) {
    // Loop through each question in the quiz
    for (var i = 0; i < quiz.questions.length; i++) {
      // Display the current question
      quiz.askQuestion(i);

      // Ask the user for their answer
      stdout.write('Your answer: ');
      var answer = stdin.readLineSync();

      // Check the user's answer
      quiz.checkAnswer(i, answer!);
    }

    // Display the final score
    quiz.showScore();
  } else {
    // If the user isn't ready, display a message and exit
    print('OK, maybe next time!');
  }
}
