import 'package:alippepro/features/home/home.dart';
import 'package:alippepro/features/login/login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    verificationUser();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => token == null || token.isEmpty
              ? const LoginScreen()
              : const HomeScreen()));
    });
  }

  var token;

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  verificationUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('x-auth-token');
    });
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
          Image.asset(
            'assets/img/logoSplash.png',
            width: 150,
            height: 80,
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
              onTap: () {},
              isRepeatingAnimation: false,
            ),
          ),
        ]),
      ),
    );
  }
}
