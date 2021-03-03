import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final List<String> _userAnswers;

  Result(this._userAnswers);

  String get resultText {
    String resultText = "Congratulations!!! \n" + "Your answers were:\n";
    for (String aAnswer in _userAnswers) resultText += aAnswer + ', ';
    resultText = resultText.substring(0, (resultText.length - 2));
    resultText += '!';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          (Text(
            resultText,
            style: TextStyle(
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          )),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
