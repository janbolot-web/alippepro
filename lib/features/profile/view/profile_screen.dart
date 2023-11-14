import 'dart:io';

import 'package:flutter/material.dart';
import 'package:alippepro_v1/providers/user_provider.dart';
import 'package:alippepro_v1/services/auth_services.dart';
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
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final Uri whatsapp = Uri.parse('https://wa.me/996990859695');

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child:
                                image != null ? Image.file(image!) : Text('a'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(user.name,
                          style: const TextStyle(
                              color: Color(0xff054e45),
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 320,
                        child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                side:
                                    const BorderSide(color: Color(0xff1b434d))),
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
                                  "5000 сом",
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
                            Ink(
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
                            const SizedBox(height: 11.0),
                            const Text(
                              'Менин \nкурстарым',
                              textAlign: TextAlign.center,
                            )
                          ]),
                          const SizedBox(width: 100.0),
                          Column(children: [
                            Ink(
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
                            const SizedBox(height: 11.0),
                            const Text(
                              'Түз эфирлер',
                              textAlign: TextAlign.center,
                            )
                          ]),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
            left: 0.0,
            bottom: 20,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 300,
                  child: OutlinedButton(
                      onPressed: () async {
                        await launchUrl(whatsapp);
                        print(whatsapp);
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          side: const BorderSide(color: Color(0xff1b434d))),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/img/message.svg'),
                          const SizedBox(width: 20),
                          const Text(
                            'Колдоо ',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff1b434d)),
                          ),
                          const SizedBox(width: 130),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: Color(0xff054e45),
                          )
                        ],
                      )),
                ))),
        ElevatedButton(
          onPressed: () => signOutUser(context),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            textStyle: MaterialStateProperty.all(
              const TextStyle(color: Colors.white),
            ),
            minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width / 2.5, 50),
            ),
          ),
          child: const Text(
            "Sign Out",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}

// SIGNOUT