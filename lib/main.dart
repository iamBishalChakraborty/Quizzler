import 'package:flutter/material.dart';
import 'package:quizzler/questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questionNumber = 0;
  List<Icon> scoreKeeper = [];
  QuestionBank questionBank = QuestionBank();

  void checkAnswers(bool tf) {
    if (questionBank.isFinished()) {
      print('Triggered');
      Alert(
        context: context,
        title: 'Finished!',
        desc: 'You\'ve reached the end of the quiz.',
      ).show();
    } else {
      if (questionBank.getQuestionAnswer() == tf) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      questionBank.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    questionBank.getQuestionText(),
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        checkAnswers(true);
                      });
                    },
                    child: Text(
                      'True',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        checkAnswers(false);
                      });
                    },
                    child: Text(
                      'False',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
