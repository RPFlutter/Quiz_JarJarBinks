import 'package:flutter/material.dart';
import 'result.dart';
import 'answer_btn.dart';
import 'question.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  int _current = 0;
  bool hasNextQuestion() => (_current < _quizes.length);
  List<String> _userAnswers = [];

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

  void _responseButtonClicked(String answer) {
    setState(() {
      _current++;
      _userAnswers.add(answer);
    });
  }

  void _restartQuiz() => setState(() {
        _current = 0;
        _userAnswers.clear();
      });

  @override
  Widget build(BuildContext context) {
    List<String> answers =
        hasNextQuestion() ? _quizes.elementAt(_current)["answers"] : null;

    List<AnswerButton> answerBtns = hasNextQuestion()
        ? answers
            .map((text) =>
                AnswerButton(label: text, onClick: _responseButtonClicked))
            .toList()
        : null;

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
                  ...answerBtns,
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
