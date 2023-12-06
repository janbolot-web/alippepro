import 'package:alippepro/components/videoPlayerView.dart';
import 'package:alippepro/features/main/widgets/carousel.dart';
import 'package:alippepro/features/main/widgets/numbersInfo.dart';
import 'package:alippepro/features/main/widgets/stories.dart';
import 'package:alippepro/features/videoPlayer/youtubeIframe.dart';
import 'package:alippepro/services/stories_services.dart';
import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.page,
  });
  final page;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final StoryService storyService = StoryService();
  // ignore: prefer_typing_uninitialized_variables
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
    super.initState();
    verificationUser();
    storyService.getAllStories(context);
  }

  final Uri whatsapp = Uri.parse('https://wa.me/996990859695');
  final Uri youtube = Uri.parse('https://wa.me/996990859695');
  final Uri tiktok = Uri.parse('https://www.tiktok.com/@alippe_pro');
  final Uri gmail = Uri.parse('https://wa.me/996990859695');
  final Uri instagram = Uri.parse('https://www.instagram.com/alippepro/');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Stories(),
        ),
        const SizedBox(
          height: 30,
        ),
        // YoutubeVideoPlayer(
        //   url: 'https://youtube.com/shorts/wL0rUXXzZ3w?feature=share',
        //   type: 'main',
        // ),
        GradientText(
          'AliPPE  PRO',
          style: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              fontFamily: 'Roboto'),
          gradientType: GradientType.linear,
          colors: const [
            Color(0xffba0f43),
            Color(0xff157d97),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Мугалимдерди',
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Color(0xff054e45),
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  fontFamily: 'Roboto'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ӨНҮКТҮРҮҮЧҮ',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Color(0xffba0f43),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      fontFamily: 'Roboto'),
                ),
                Text(
                  ' жана',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Color(0xff054e45),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      fontFamily: 'Roboto'),
                ),
              ],
            ),
            Text(
              'ШЫКТАНДЫРУУЧУ',
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Color(0xffba0f43),
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  fontFamily: 'Roboto'),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        GradientText(
          'Кыргызстандагы\nалгачкы тиркеме',
          style: const TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w900,
              fontFamily: 'Roboto'),
          gradientType: GradientType.linear,
          colors: const [
            Color(0xffba0f43),
            Color(0xff157d97),
          ],
          textAlign: TextAlign.center,
        ),

        const SizedBox(
          height: 45,
        ),
        // YoutubeIframe(
        //   type: 'main',
        //   url: "QNxS0OcXids",
        // ),

        const VideoPlayerView(
          url:
              "https://wave.video/embed/6559fdb93c5d7c5ccbf8a505/6559fdb93c5d7c5ccbf8a503.mov",
          showControls: "",
        ),
        const SizedBox(
          height: 40,
        ),

        Container(
            margin: const EdgeInsets.only(top: 20.0), child: NumbersInfo()),
        const SizedBox(
          height: 40,
        ),

        const SizedBox(
          height: 22,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: GradientText(
            'Бардык заманбап\nжана эфективдүү\nметодикалар ушул\nжерде!',
            style: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w900,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
            gradientType: GradientType.linear,
            colors: const [
              Color(0xffba0f43),
              Color(0xff157d97),
            ],
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Carousel(),
        const SizedBox(
          height: 98,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // YoutubeIframe(
                //   type: 'review',
                //   url: "QNxS0OcXids",
                // ),
                const VideoPlayerView(
                  place:'assets/img/reviews1.png',
                    width: 200.0,
                    height: 200.0,
                    auto: false,
                    url:
                        "https://wave.video/embed/6559fdb93c5d7c5ccbf8a505/6559fdb93c5d7c5ccbf8a503.mov",
                    showControls: ""),
                // const SizedBox(
                //   width: 20,
                // ),
                Column(
                  children: [
                    GradientText(
                      'Чыныгүл эжей',
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                      gradientType: GradientType.linear,
                      colors: const [
                        Color(0xffba0f43),
                        Color(0xff157d97),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GradientText(
                      '“Кесибимди\n сүйүп\n баштадым...”',
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                      gradientType: GradientType.linear,
                      colors: const [
                        Color(0xffba0f43),
                        Color.fromARGB(255, 18, 158, 205)
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GradientText(
                      'Окуучуларын\n300-400 сөзгө\nжеткирген\nАйжан эжей',
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                      textAlign: TextAlign.end,
                      gradientType: GradientType.linear,
                      colors: const [
                        Color(0xff157d97),
                        Color(0xffba0f43),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                const VideoPlayerView(
                  place:'assets/img/reviews1.png',
                    width: 200.0,
                    height: 200.0,
                    auto: false,
                    url:
                        "https://wave.video/embed/6559fdb93c5d7c5ccbf8a505/6559fdb93c5d7c5ccbf8a503.mov",
                    showControls: ""),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const VideoPlayerView(
                  place:'assets/img/reviews1.png',
                    width: 200.0,
                    height: 200.0,
                    auto: false,
                    url:
                        "https://wave.video/embed/6559fdb93c5d7c5ccbf8a505/6559fdb93c5d7c5ccbf8a503.mov",
                    showControls: ""),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      'Гүлмира эжей',
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                      gradientType: GradientType.linear,
                      colors: const [
                        Color(0xffba0f43),
                        Color(0xff157d97),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GradientText(
                      '“Мугалим\nкошумча капитал\nтоптосо боло\nэкен”',
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                      gradientType: GradientType.linear,
                      colors: const [
                        Color(0xffba0f43),
                        Color.fromARGB(255, 18, 158, 205)
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      'Алтынай эжей',
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                      gradientType: GradientType.linear,
                      colors: const [
                        Color(0xffba0f43),
                        Color(0xff157d97),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GradientText(
                      '“Окуучуларым\nдын берилип\nокуганына таң\n калдым”',
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                      textAlign: TextAlign.end,
                      gradientType: GradientType.linear,
                      colors: const [
                        Color(0xffba0f43),
                        Color.fromARGB(255, 18, 158, 205)
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                const VideoPlayerView(
                  place:'assets/img/reviews1.png',
                  width: 200.0,
                  height: 200.0,
                  url:
                      "https://wave.video/embed/6559fdb93c5d7c5ccbf8a505/6559fdb93c5d7c5ccbf8a503.mov",
                  showControls: "",
                  full: false,
                  auto: false,
                  loop: false,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 145,
        ),
        GradientText(
          'Жаңы деңгээлге',
          style: const TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w900,
              fontFamily: 'Roboto'),
          textAlign: TextAlign.end,
          gradientType: GradientType.linear,
          colors: const [Color(0xffba0f43), Color.fromARGB(255, 18, 158, 205)],
        ),

        const SizedBox(
          height: 25,
        ),
        const Text(
          'КАДАМ',
          style: TextStyle(
              color: Color(0xff0e4958),
              fontWeight: FontWeight.bold,
              fontSize: 32,
              fontFamily: "Roboto"),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'таштаңыз!',
          style: TextStyle(
              color: Color(0xff0e4958),
              fontWeight: FontWeight.bold,
              fontSize: 26,
              fontFamily: "Roboto"),
        ),
        const SizedBox(
          height: 45,
        ),
        Image.asset(
          'assets/img/arrowDown.png',
          width: 58,
          height: 56,
        ),
        const SizedBox(
          height: 65,
        ),
        FloatingActionButton.extended(
          backgroundColor: const Color(0xff088273),
          extendedPadding: const EdgeInsets.symmetric(horizontal: 40),
          onPressed: () {
            widget.page();
          },
          label: const Text(
            'КУРСТАРГА',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto"),
          ),
        ),
        const SizedBox(
          height: 107,
        ),
        Column(
          children: [
            Image.asset(
              'assets/img/logoMain.png',
              width: 130,
              height: 70,
            ),
            const Text(
              'Биз байланыштабыз!',
              style: TextStyle(color: Color(0xff1b434d)),
            )
          ],
        ),
        const SizedBox(
          height: 87,
        ),
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Color(0xffba0f43),
                ),
                SizedBox(
                  width: 33,
                ),
                Text(
                  'Исанова 102 Бишкек ш.',
                  style: TextStyle(
                      color: Color(0xff1b434d), fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                    onPressed: () async {
                      await launchUrl(whatsapp);
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    focusElevation: 0,
                    hoverElevation: 0,
                    child: Image.asset(
                      'assets/img/youtube.png',
                      width: 20,
                      height: 20,
                    )),
                FloatingActionButton(
                    onPressed: () async {
                      await launchUrl(whatsapp);
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    focusElevation: 0,
                    hoverElevation: 0,
                    child: Image.asset(
                      'assets/img/gmail.png',
                      width: 20,
                      height: 20,
                    )),
                FloatingActionButton(
                    onPressed: () async {
                      await launchUrl(instagram);
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    focusElevation: 0,
                    hoverElevation: 0,
                    child: Image.asset(
                      'assets/img/instagram.png',
                      width: 20,
                      height: 20,
                    )),
                FloatingActionButton(
                    onPressed: () async {
                      await launchUrl(tiktok);
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    focusElevation: 0,
                    hoverElevation: 0,
                    child: Image.asset(
                      'assets/img/tiktok.png',
                      width: 20,
                      height: 20,
                    )),
                FloatingActionButton(
                    onPressed: () async {
                      await launchUrl(whatsapp);
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    focusElevation: 0,
                    hoverElevation: 0,
                    child: Image.asset(
                      'assets/img/WhatsApp.png',
                      width: 20,
                      height: 20,
                    )),
              ],
            ),
            const SizedBox(height: 35),
          ],
        )
      ],
    ));
  }
}
