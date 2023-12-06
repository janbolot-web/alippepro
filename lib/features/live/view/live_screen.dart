import 'dart:math';

import 'package:alippepro/providers/user_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
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

  final liveIDController = TextEditingController(text: 123456.toString());

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    var buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: Color(0xff034ada),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 14),
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: Color(0xffba0f43),
                  width: 1.5,
                )),
              ),
              child: const Text('Түз эфир',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      color: Color(0xff1b434d),
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 20,
            ),
            user.roles[0] == "ADMIN"
                ? ElevatedButton(
                    onPressed: () {
                      jumpToLivePage(context,
                          liveID: liveIDController.text,
                          isHost: true,
                          user: user);
                    },
                    child: const Text(
                      "Түз эфирди баштоо",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: buttonStyle,
                  )
                : ElevatedButton(
                    onPressed: () {
                      jumpToLivePage(context,
                          liveID: liveIDController.text,
                          isHost: false,
                          user: user);
                    },
                    child: const Text("Түз эфирге кошулуу",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: buttonStyle,
                  ),
          ],
        ),
      ),
    );
  }

  jumpToLivePage(BuildContext context,
      {required String liveID, required bool isHost, required user}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LivePage(
                  liveID: liveID,
                  isHost: isHost,
                  userData: user,
                )));
  }
}

class LivePage extends StatelessWidget {
  final String liveID;
  final bool isHost;
  final userData;
  LivePage(
      {super.key, required this.liveID, this.isHost = false, this.userData});

  final int appID = int.parse(dotenv.get('ZEGO_APP_ID'));
  final String appSign = dotenv.get("ZEGO_APP_SIGN");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
          appID: appID,
          appSign: appSign,
          userID: userID,
          userName: userData.name.toString(),
          liveID: liveID,
          config: isHost
              ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
              : ZegoUIKitPrebuiltLiveStreamingConfig.audience()
            ..avatarBuilder = (BuildContext context, Size size,
                ZegoUIKitUser? user, Map extraInfo) {
              return user != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            userData.avatarUrl.toString(),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            }),
    );
  }
}
