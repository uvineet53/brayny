import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brayny/backend/constants/testTrackData.dart';
import 'package:brayny/backend/controllers/alanController.dart';
import 'package:brayny/frontend/pages/quiz.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final alanController = Get.put(AlanController());
  bool _greetingIsPlayed = false;

  @override
  void initState() {
    super.initState();
    AlanVoice.addButton(
        "3331b67c2d29908a03a03c68e67bfd8e2e956eca572e1d8b807a3e2338fdd0dc/testing",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);
    AlanVoice.onCommand.add((command) {
      alanController.handleCommand(command.data);
    });
    AlanVoice.onButtonState.add((state) {
      if (state.name == "ONLINE" && !_greetingIsPlayed) {
        _greetingIsPlayed = true;
        AlanVoice.activate();
        AlanVoice.playText("Hello! I'm Brayny. How can I help you?");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          elevation: 0,
          title: HStack([
            "BRAY".text.white.xl3.make(),
            "NY".text.yellow500.xl3.make(),
          ]),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            "Learn Maths".text.xl2.bold.white.makeCentered(),
            VxSwiper.builder(
                itemCount: mathTrack.length,
                enlargeCenterPage: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      key: Key(mathTrack[index]['id'].toString()),
                      onTap: () {
                        Get.to(ProblemPage(
                            track: mathTrack[index]['track'].toString()));
                      },
                      child: VxBox(
                        child: mathTrack[index]['title']
                            .toString()
                            .text
                            .bold
                            .xl2
                            .white
                            .makeCentered(),
                      ).width(context.width * .7).gray700.rounded.make());
                }),
            "Learn English".text.xl2.bold.white.makeCentered(),
            VxSwiper.builder(
                itemCount: englishTrack.length,
                enlargeCenterPage: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      key: Key(englishTrack[index]['id'].toString()),
                      onTap: () {
                        Get.to(ProblemPage(
                            track: englishTrack[index]['track'].toString()));
                      },
                      child: VxBox(
                        child: englishTrack[index]['title']
                            .toString()
                            .text
                            .bold
                            .xl2
                            .makeCentered(),
                      ).width(context.width * .7).yellow300.rounded.make());
                }),
            const SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}
