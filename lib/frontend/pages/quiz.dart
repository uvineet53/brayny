import 'package:alan_voice/alan_voice.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brayny/backend/constants/constants.dart';
import 'package:brayny/backend/controllers/alanController.dart';
import 'package:brayny/backend/controllers/quizController.dart';
import 'package:velocity_x/velocity_x.dart';

class ProblemPage extends StatefulWidget {
  final String track;
  ProblemPage({Key? key, required this.track}) : super(key: key);

  @override
  State<ProblemPage> createState() => _ProblemPageState();
}

class _ProblemPageState extends State<ProblemPage> {
  final QuizController _quizController = Get.put(QuizController());
  final _countdownController = CountDownController();
  final alanController = Get.put(AlanController());

  late Map<String, dynamic> question;
  @override
  void initState() {
    question = _quizController.handlerFunction(widget.track);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularCountDownTimer(
                  duration: Constants().timerDuration,
                  initialDuration: 0,
                  controller: _countdownController,
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: MediaQuery.of(context).size.height / 2.8,
                  ringColor: Vx.gray100,
                  ringGradient: null,
                  fillColor: Vx.blue300,
                  fillGradient: null,
                  backgroundColor: Vx.blue500,
                  backgroundGradient: null,
                  strokeWidth: 20.0,
                  strokeCap: StrokeCap.round,
                  textStyle: const TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.S,
                  isReverse: true,
                  isReverseAnimation: true,
                  isTimerTextShown: true,
                  autoStart: true,
                  onStart: () async {
                    if (!(await AlanVoice.isActive())) {
                      AlanVoice.activate();
                    }
                    alanController.handleQuestion(question);
                  },
                  onComplete: () {
                    setState(() {
                      question = _quizController.handlerFunction(widget.track);
                    });
                    _countdownController.restart(
                        duration: Constants().timerDuration);
                  },
                ),
                Text(
                  question['question'],
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Vx.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
