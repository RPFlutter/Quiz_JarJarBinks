import 'package:flutter/material.dart';
import 'data/quiz_data.dart';
import 'result.dart';
import 'answer_btn.dart';
import 'question.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  int _current = 0;
  //var _quizes = Quiz.data;
  bool hasNextQuestion() => (_current < _quizes.length);
  List<String> _userAnswers = [];
  static final List _quizes = [
    {
      'question': Question('What\'s your favorite color?'),
      "answers": [
        {'text': 'Red', 'value': 1},
        {'text': 'Blue', 'value': 2},
        {'text': 'White', 'value': 3},
        {'text': 'Yellow', 'value': 4},
        {'text': 'Black', 'value': 5},
      ]
    },
    {
      'question': Question('What\'s your favorite animal?'),
      "answers": [
        {'text': 'Snake', 'value': 1},
        {'text': 'Elephant', 'value': 2},
        {'text': 'Eagle', 'value': 3},
        {'text': 'Lion', 'value': 4},
        {'text': 'Spider', 'value': 5},
      ]
    },
    {
      'question': Question('What\'s your favorite food?'),
      "answers": [
        {'text': 'Pizza', 'value': 1},
        {'text': 'HotDog', 'value': 2},
        {'text': 'Sandwich', 'value': 3},
        {'text': 'French Fries', 'value': 4},
        {'text': 'Bacon', 'value': 5},
      ]
    },
    {
      'question': Question('What\'s your favorite drink?'),
      "answers": [
        {'text': 'Beer', 'value': 1},
        {'text': 'Soda', 'value': 2},
        {'text': 'Water', 'value': 3},
        {'text': 'Juice', 'value': 4},
        {'text': 'Milk', 'value': 5},
      ]
    },
  ];

  void _responseButtonClicked(String answer) => setState(() {
        _current++;
        _userAnswers.add(answer);
      });

  void _restartQuiz() => setState(() {
        _current = 0;
        _userAnswers.clear();
      });

  List<AnswerButton> get currentAnswers {
    if (hasNextQuestion()) {
      List<String> answers = [];

      for (Map aAnswer in _quizes.elementAt(_current)['answers']) {
        answers.add(aAnswer['text']);
      }
      List<AnswerButton> answerBtns = answers
          .map((text) =>
              AnswerButton(label: text, onClick: _responseButtonClicked))
          .toList();

      return answerBtns;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          centerTitle: true,
        ),
        body: hasNextQuestion()
            ? Column(
                children: [
                  _quizes[_current]['question'],
                  ...currentAnswers,
                ],
              )
            : Result(_userAnswers),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: hasNextQuestion()
            ? null
            : FloatingActionButton(
                onPressed: _restartQuiz,
                child: Icon(Icons.arrow_back),
              ),
      ),
    ));
  }
}

class QuizApp extends StatefulWidget {
  @override
  createState() => _QuizAppState();
}
