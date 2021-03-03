import 'package:flutter/material.dart';
import 'answer_btn.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  static final List<Map<String, Object>> data = [
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
  final int _current;
  final void Function(String) _onClickAnswer;

  Quiz(this._current, this._onClickAnswer);

  static bool hasNextQuestion(int currentState) => currentState < data.length;

  List<AnswerButton> get currentAnswers {
    if (hasNextQuestion(_current)) {
      List<String> answers = [];

      for (Map aAnswer in data.elementAt(_current)['answers']) {
        answers.add(aAnswer['text']);
      }
      List<AnswerButton> answerBtns = answers
          .map((text) => AnswerButton(label: text, onClick: _onClickAnswer))
          .toList();

      return answerBtns;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: data[_current]['question'],
          padding: EdgeInsets.only(bottom: 50, top: 30),
        ),
        Column(
          children: [...currentAnswers],
        )
      ],
    );
  }
}
