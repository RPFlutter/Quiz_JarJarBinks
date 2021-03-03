import '../question.dart';

class Quiz {
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
}
