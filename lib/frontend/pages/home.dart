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

  @override
  void initState() {
    super.initState();
    AlanVoice.addButton(
        "36cf10a045ad4f147daed15d057fa38b2e956eca572e1d8b807a3e2338fdd0dc/prod",
        buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);
    AlanVoice.onCommand.add((command) {
      alanController.handleCommand(command.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: HStack([
            "Bray".text.black.xl3.make(),
            "ny".text.yellow500.xl3.make(),
          ]),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text(
                "Learn Maths",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
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
                              .xl2
                              .makeCentered(),
                        ).width(context.width * .7).yellow300.rounded.make());
                  }),
              SizedBox(height: 40),
              const Text(
                "Learn English",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
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
                              .xl2
                              .makeCentered(),
                        ).width(context.width * .7).yellow300.rounded.make());
                  }),
            ],
          ),
        ));
  }
}
