import 'dart:math';

import 'package:brayny/backend/constants/constants.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  Map<String, dynamic> _question = {};
  int random(min, max) {
    var rn = Random();
    return min + rn.nextInt(max - min);
  }

  Map<String, dynamic> additonQuiz() {
    int a = random(10, 99);
    int b = random(10, 99);
    int result = a + b;
    return {'question': '$a + $b', 'result': result};
  }

  Map<String, dynamic> oppositeQuiz() {
    int a = random(0, 4);
    return Constants.oppositesData[a];
  }

  Map<String, dynamic> vowelQuiz() {
    int a = random(0, 4);
    return Constants.vowelData[a];
  }

  Map<String, dynamic> rhymingQuiz() {
    int a = random(0, 4);
    return Constants.rhymingData[a];
  }

  Map<String, dynamic> articlesQuiz() {
    int a = random(0, 4);
    return Constants.articleData[a];
  }

  Map<String, dynamic> multiplicationQuiz() {
    int a = random(1, 10);
    int b = random(1, 10);
    int result = a * b;
    return {'question': '$a times $b', 'result': result};
  }

  Map<String, dynamic> squaresQuiz() {
    int a = random(1, 25);
    int result = a * a;
    return {'question': '$a to the power 2', 'result': result};
  }

  Map<String, dynamic> handlerFunction(String track) {
    switch (track) {
      case 'addition':
        _question = additonQuiz();
        break;
      case 'multiplication':
        _question = multiplicationQuiz();
        break;
      case 'squares':
        _question = squaresQuiz();
        break;
      case 'vowels':
        _question = vowelQuiz();
        break;
      case 'rhyming words':
        _question = rhymingQuiz();
        break;
      case 'opposites':
        _question = oppositeQuiz();
        break;
      case 'articles':
        _question = articlesQuiz();
        break;
    }
    return _question;
  }

  Map<String, dynamic> getCurrentQuestion() {
    return _question;
  }
}
