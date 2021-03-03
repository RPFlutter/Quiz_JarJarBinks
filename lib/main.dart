import 'package:flutter/material.dart';
import 'components/quiz.dart';
import 'components/result.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  int _currentQuestion = 0;
  List<String> _userAnswers = [];

  void _answerButtonClicked(String answer) => setState(() {
        _currentQuestion++;
        _userAnswers.add(answer);
      });

  void _restartQuiz() => setState(() {
        _currentQuestion = 0;
        _userAnswers.clear();
      });

  bool get _hasNextQuestion => Quiz.hasNextQuestion(_currentQuestion);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          centerTitle: true,
        ),
        body: _hasNextQuestion
            ? Quiz(_currentQuestion, _answerButtonClicked)
            : Result(_userAnswers),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: _hasNextQuestion
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
