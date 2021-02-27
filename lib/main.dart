import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';

main() => runApp(QuizApp());

class QuizAppState extends State <QuizApp> {

  var current = 0;
  bool hasNextQuestion () => (current < _quizes.length);

  final List <Map<String, Object>> _quizes =[
    {
        "question": Question('What\'s your favorite color?'),
        "possibleAnswers": []
    }, 
    {
        "question": Question('What\'s your favorite animal?'),
        "possibleAnswers": []
    }, 
    {
        "question": Question('What\'s your favorite food?'),
        "possibleAnswers": []
    }, 
    {
        "question": Question('What\'s your favorite drink?'),
        "possibleAnswers": []
    }, 
  ];
  
  
  void responseButtonClicked () {
    print("Question ${current + 1} answered!!!");
    
    setState(() {
      current++;
    }); 
  } 

  @override
  Widget build(BuildContext context) {
    return ( MaterialApp(
        
        home: Scaffold(
          appBar: AppBar(
            title: Text('Jar Jar Binks Quiz'),
            centerTitle: true,
          ),

          body: hasNextQuestion() ? Column(
              children: [
                _quizes[current]["question"],
                ElevatedButton(
                  child: Text('Answer01'),
                  onPressed: responseButtonClicked,
                ),
                
                ElevatedButton(
                  child: Text('Answer02'),
                  onPressed: responseButtonClicked,
                ),
                
                ElevatedButton(
                  child: Text('Answer03'),
                  onPressed: responseButtonClicked,
                )
              ],
            ) 
            : null
        )
      )
    );
  }
}

class QuizApp extends StatefulWidget {
  
  @override
  createState() => QuizAppState();
}
