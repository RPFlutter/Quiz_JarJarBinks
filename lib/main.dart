import 'package:flutter/material.dart';
import 'answer_btn.dart';
import 'question.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  int _current = 0;
  bool hasNextQuestion() => (_current < _quizes.length);

  final List<Map<String, Object>> _quizes = [
    {
      'question': Question('What\'s your favorite color?'),
      "answers": ['Red', 'Blue', 'Yellow', 'Black', 'White']
    },
    {
      'question': Question('What\'s your favorite animal?'),
      "answers": ['Snake', 'Elephant', 'Eagle', 'Lion', 'Spider']
    },
    {
      'question': Question('What\'s your favorite food?'),
      "answers": ['Pizza', 'HotDog', 'Sandwich', 'French Fries', 'Bacon']
    },
    {
      'question': Question('What\'s your favorite drink?'),
      "answers": ['Beer', 'Soda', 'Water', 'Juice']
    },
  ];

  void _responseButtonClicked() => setState(() => _current++);

  void _restartQuiz() => setState(() => _current = 0);

  @override
  Widget build(BuildContext context) {
    List<String> answers =
        hasNextQuestion() ? _quizes.elementAt(_current)["answers"] : null;

    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          centerTitle: true,
        ),
        body: hasNextQuestion()
            ? Column(
                children: [
                  _quizes[_current]['question'],
                  ...answers.map(
                      (text) => AnswerButton(text, _responseButtonClicked)),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 250),
                    padding: EdgeInsets.only(
                      right: 25,
                      left: 25,
                      bottom: 25,
                      top: 320,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Congratulations!!!",
                      style: TextStyle(fontSize: 45.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25),
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      onPressed: _restartQuiz,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
      ),
    ));
  }
}

class QuizApp extends StatefulWidget {
  @override
  createState() => _QuizAppState();
}
