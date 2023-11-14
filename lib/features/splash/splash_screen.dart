import 'package:alippepro_v1/features/home/home.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff006a6e), Color(0xff088273)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.abc_outlined,
            size: 80,
            color: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          DefaultTextStyle(
            style: const TextStyle(
                fontSize: 16.0, fontFamily: 'Comfortaa', color: Colors.white),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Мугалимдерди өнүктүрүүчү аянтча',
                  cursor: '|',
                  speed: const Duration(milliseconds: 30),
                ),
              ],
              onTap: () {
                print("Tap Event");
              },
              isRepeatingAnimation: false,
            ),
          ),
        ]),
      ),
    );
  }
}
