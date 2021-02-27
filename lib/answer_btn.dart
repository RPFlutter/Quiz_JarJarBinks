import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnswerButton extends StatelessWidget {
  final String _btnText;
  final void Function() _btnClicked;

  AnswerButton(this._btnText, this._btnClicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 85,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        autofocus: false,
        clipBehavior: Clip.none,
        onPressed: _btnClicked,
        child: Text(
          _btnText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
