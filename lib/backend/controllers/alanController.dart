import 'dart:convert';
import 'package:alan_voice/alan_voice.dart';
import 'package:get/get.dart';
import 'package:brayny/backend/controllers/quizController.dart';
import 'package:brayny/frontend/pages/quiz.dart';

class AlanController extends GetxController {
  void handleCommand(Map<String, dynamic> command) {
    if (command['command'] == 'navigate') {
      _handleNavigation(command['route']);
    } else if (command['command'] == 'handleAnswer') {
      _handleAnswer(command['value']);
    }
  }

  void setVisualState(String screen) {
    var visualState = jsonEncode({"screen": screen});
    AlanVoice.setVisualState(visualState);
  }

  void _handleNavigation(String route) {
    if (route == 'back') {
      Get.back();
      AlanVoice.deactivate();
    } else {
      Get.to(() => ProblemPage(track: route));
    }
  }

  void handleQuestion(Map<String, dynamic> question) {
    AlanVoice.playText("What is ${question['question']}");
  }

  void _handleAnswer(String response) {
    QuizController quizController = Get.put(QuizController());
    String result = quizController.getCurrentQuestion()['result'].toString();
    if (response == result) {
      AlanVoice.playText("Correct Answer!");
    } else {
      AlanVoice.playText("Wrong Answer! The correct Answer is: $result");
    }
  }
}
