import 'package:alippepro/features/login/login_screen.dart';
import 'package:alippepro/features/splash/splash_screen.dart';
import 'package:alippepro/providers/course_provider.dart';
import 'package:alippepro/providers/story_provider.dart';
import 'package:flutter/material.dart';
import 'package:alippepro/providers/user_provider.dart';
import 'package:alippepro/features/sign/signup_screen.dart';
import 'package:alippepro/services/auth_services.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (context) => CourseDetailProvider()),
        ChangeNotifierProvider(create: (context) => StoryProvider()),
      ],
      child: const AlippePro(),
    ),
  );
}

class AlippePro extends StatefulWidget {
  const AlippePro({Key? key}) : super(key: key);

  @override
  State<AlippePro> createState() => _AlippeProState();
}

class _AlippeProState extends State<AlippePro> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alippepro',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Comfortaa'),
        home: const SplashScreen());
  }
}
