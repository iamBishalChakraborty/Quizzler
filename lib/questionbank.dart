import 'package:quizzler/question.dart';

class QuestionBank {
  int questionNumber = 0;

  List<Question> _questionSet = [
    Question(q: 'Question Set 1', a: true),
    Question(q: 'Question Set 2', a: true),
    Question(q: 'Question Set 3', a: false),
    Question(q: 'Question Set 4', a: false),
    Question(q: 'Question Set 5', a: true),
  ];

  nextQuestion() {
    if (questionNumber < _questionSet.length - 1) questionNumber++;
  }

  getQuestionText() {
    return _questionSet[questionNumber].questionText;
  }

  getQuestionAnswer() {
    return _questionSet[questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (questionNumber == _questionSet.length - 1)
      return true;
    else
      return false;
  }
}
