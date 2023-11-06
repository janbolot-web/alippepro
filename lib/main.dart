import 'package:alippepro_v1/features/splash/splash_screen.dart';
import 'package:alippepro_v1/providers/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:alippepro_v1/providers/user_provider.dart';
import 'package:alippepro_v1/features/home/home.dart';
import 'package:alippepro_v1/features/sign/signup_screen.dart';
import 'package:alippepro_v1/services/auth_services.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (context) => CourseProvider()),
          ChangeNotifierProvider(create: (context) => CourseDetailProvider()),
        ],
        child: const AlippePro(),
      ),
    );
  });
}

class AlippePro extends StatefulWidget {
  const AlippePro({Key? key}) : super(key: key);

  @override
  State<AlippePro> createState() => _AlippeProState();
}

var token;

class _AlippeProState extends State<AlippePro> {
  final AuthService authService = AuthService();

  verificationUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('x-auth-token');
    });
  }

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
    verificationUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Alippepro',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: token.toString().isEmpty ? const SignupScreen() : SplashScreen());
  }
}
