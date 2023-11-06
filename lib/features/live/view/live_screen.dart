import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'package:flutter/material.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

final String userID = Random().nextInt(900000 + 100000).toString();

class _LiveScreenState extends State<LiveScreen> {
  @override
  Widget build(BuildContext context) {
    return LiveScreenIn();
  }
}

class LiveScreenIn extends StatelessWidget {
  LiveScreenIn({super.key});

  final liveIDController =
      TextEditingController(text: Random().nextInt(900000 + 100000).toString());

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: Color(0xff034ada),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/img/courses1.svg',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Your userID: $userID"),
            Text("Пожалуйста подключите не менее 2 устройства"),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: liveIDController,
              decoration: InputDecoration(
                  labelText: 'Присоединится или начать транцлятцию',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                jumpToLivePage(context,
                    liveID: liveIDController.text, isHost: true);
              },
              child: const Text("Начать транцлятцую"),
              style: buttonStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                jumpToLivePage(context,
                    liveID: liveIDController.text, isHost: false);
              },
              child: const Text("Присоединиться транцлятцую"),
              style: buttonStyle,
            )
          ],
        ),
      ),
    );
  }

  jumpToLivePage(BuildContext context,
      {required String liveID, required bool isHost}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LivePage(
                  liveID: liveID,
                  isHost: isHost,
                )));
  }
}

class LivePage extends StatelessWidget {
  final String liveID;
  final bool isHost;
  LivePage({super.key, required this.liveID, this.isHost = false});

  final int appID = int.parse(dotenv.get('ZEGO_APP_ID'));
  final String appSign = dotenv.get("ZEGO_APP_SIGN");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
          appID: appID,
          appSign: appSign,
          userID: userID,
          userName: 'user_$userID',
          liveID: liveID,
          config: isHost
              ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
              : ZegoUIKitPrebuiltLiveStreamingConfig.audience()),
    );
  }
}
