import 'dart:io';

import 'package:alippepro/features/liveList/liveListScreen.dart';
import 'package:alippepro/features/myCourses/view/myCourses_screen.dart';
import 'package:alippepro/features/users/usersScreen.dart';
import 'package:flutter/material.dart';
import 'package:alippepro/providers/user_provider.dart';
import 'package:alippepro/services/auth_services.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  void signOutUser(BuildContext context) {
    AuthService().signOut(context);
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    // final Uri whatsapp = Uri.parse('https://wa.me/996990859695');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/img/reviews1.png'),
                  ),
                  const SizedBox(height: 20),
                  Text(user.name,
                      style: const TextStyle(
                          color: Color(0xff054e45),
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 320,
                    child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: const BorderSide(color: Color(0xff1b434d))),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/img/shape.svg'),
                            const SizedBox(width: 20),
                            Container(
                              padding: const EdgeInsets.only(right: 45.0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Color(0xff1b434d)))),
                              child: const Text(
                                'Бонус',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff1b434d)),
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Text(
                              "0 сом",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xffba0f43)),
                            ),
                            const SizedBox(width: 25),
                            const Icon(
                              Icons.question_mark_sharp,
                              size: 20,
                              color: Color(0xffb8c7c5),
                            )
                          ],
                        )),
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyCoursesScreen(user: user),
                              ),
                            );
                          },
                          child: Ink(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color(0xffba0f43),
                                    Color.fromARGB(255, 255, 209, 209)
                                  ]),
                                  borderRadius: BorderRadius.circular(50)),
                              child: SvgPicture.asset(
                                  "assets/img/myCourseIcon.svg",
                                  height: 30,
                                  width: 40,
                                  fit: BoxFit.scaleDown)),
                        ),
                        const SizedBox(height: 11.0),
                        const Text(
                          'Менин \nкурстарым',
                          textAlign: TextAlign.center,
                        )
                      ]),
                      const SizedBox(width: 100.0),
                      Column(children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LiveListScreen(),
                              ),
                            );
                          },
                          child: Ink(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color(0xff1b434d),
                                    Color(0xffb8c7c5)
                                  ]),
                                  borderRadius: BorderRadius.circular(50)),
                              child: SvgPicture.asset(
                                  "assets/img/bookmarkIcon.svg",
                                  height: 30,
                                  width: 40,
                                  fit: BoxFit.scaleDown)),
                        ),
                        const SizedBox(height: 11.0),
                        const Text(
                          'Түз эфирлер',
                          textAlign: TextAlign.center,
                        )
                      ]),
                    ],
                  ),
                  const SizedBox(height: 36),
                  user.roles[0] == "ADMIN"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => UsersScreen(),
                                    ),
                                  );
                                },
                                child: Ink(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(colors: [
                                          Color(0xff0437f2),
                                          Color(0xff6495ed)
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.people,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                              ),
                              const SizedBox(height: 11.0),
                              const Text(
                                'Колдонуучулар',
                                textAlign: TextAlign.center,
                              )
                            ]),
                            const SizedBox(width: 70.0),
                            Column(children: [
                              TextButton(
                                onPressed: () {},
                                child: Ink(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(colors: [
                                          Color(0xff0437f2),
                                          Color(0xff6495ed)
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.people,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                              ),
                              const SizedBox(height: 11.0),
                              const Text(
                                'Медиафайлдар',
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () => signOutUser(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.white),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    Size(80, 30),
                  ),
                ),
                child: Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Чыгуу",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
