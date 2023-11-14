import 'package:alippepro_v1/components/videoPlayerView.dart';
import 'package:alippepro_v1/features/main/widgets/carousel.dart';
import 'package:alippepro_v1/features/main/widgets/numbersInfo.dart';
import 'package:alippepro_v1/features/main/widgets/stories.dart';
import 'package:alippepro_v1/features/reviews/reviews.dart';
import 'package:alippepro_v1/providers/story_provider.dart';
import 'package:alippepro_v1/services/stories_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:video_player/video_player.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final StoryService storyService = StoryService();
  var user;

  verificationUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user');
    setState(() {
      user = token;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificationUser();
    storyService.getAllStories(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stories(),
          Container(
              margin: new EdgeInsets.only(top: 20.0), child: NumbersInfo()),
          SizedBox(
            height: 40,
          ),
          VideoPlayerView(
              url:
                  "https://work.220youtube.ru/youtube/cayiHYUM32g/download/22?title=2%20%20%20%D0%A1%D0%B0%D0%B1%D0%B0%D0%BA%20(720p)",
              showControls: "false"),
          SizedBox(
            height: 22,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: GradientText(
              'AliPPE PRO\nмугалимдерди\nшыктандыруучу\nаянтча',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w900,
                fontFamily: 'Roboto',
              ),
              textAlign: TextAlign.end,
              gradientType: GradientType.linear,
              colors: [
                Color(0xffba0f43),
                Color(0xff157d97),
              ],
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Carousel(),
          SizedBox(
            height: 65,
          ),
          Column(
            children: [
              Image.asset(
                'assets/img/logoMain.png',
                width: 130,
                height: 70,
              ),
              Text(
                'Биз байланыштабыз!',
                style: TextStyle(color: Color(0xff1b434d)),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
