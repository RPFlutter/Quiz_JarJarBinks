import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnswerButton extends StatelessWidget {
  final String label;
  final void Function(String) onClick;

  AnswerButton({
    @required this.label,
    @required this.onClick,
  });

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
        onPressed: () => onClick(label),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
