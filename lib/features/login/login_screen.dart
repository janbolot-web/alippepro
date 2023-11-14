import 'package:alippepro_v1/features/sign/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:alippepro_v1/custom_textfield.dart';
import 'package:alippepro_v1/services/auth_services.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void loginUser() {
    var a = authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Мугалимдерди өнүктүрүүчү аянтча",
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w700,
                color: Color(0xff054e45)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          SvgPicture.asset(
            'assets/img/user.svg',
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
                controller: emailController,
                hintText: '',
                labelText: 'Электрондук почтаңыз',
                type: 'email'),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
                controller: passwordController,
                hintText: '',
                labelText: 'Сыр сөзүңүз ',
                type: 'password'),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: loginUser,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff088273)),
              textStyle: MaterialStateProperty.all(
                const TextStyle(color: Colors.white),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width / 2.5, 50),
              ),
            ),
            child: const Text(
              "КИРҮҮ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'RobotoFlex',
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Column(
            children: [
              Text('Эгер аккаунтуңуз жок болсо, анда'),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'жаңы аккаунт ачуу',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
