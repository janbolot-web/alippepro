import 'package:alippepro_v1/providers/course_provider.dart';
import 'package:alippepro_v1/services/course_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:redacted/redacted.dart';
import 'package:shimmer/shimmer.dart';
import '../../courseDetail/courseDetail.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final CourseService courseService = CourseService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    courseService.getAllCourses(context);
  }

  @override
  Widget build(BuildContext context) {
    var id = Provider.of<CourseProvider>(context).course.id;
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(30, 0, 30, 35),
          padding: const EdgeInsets.only(bottom: 14),
          decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
              color: Color(0xffba0f43),
              width: 1.5,
            )),
          ),
          child: const Text('Курстар',
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff1b434d),
                  fontWeight: FontWeight.bold)),
        ),
        Center(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CourseDetailScreen(
                            idCourse: id,
                          ),
                        ),
                      );
                    },
                    child: id.isNotEmpty
                        ? Ink(
                            width: 150,
                            height: 95,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color(0xff3cd8c5),
                                  Color(0xff088273)
                                ]),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'ШАР ОКУУ\nМУГАЛИМИ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'RobotoFlex'),
                                            textAlign: TextAlign.end,
                                          )
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.white,
                                            child: SvgPicture.asset(
                                              'assets/img/courses1.svg',
                                            ),
                                          )
                                        ])
                                  ]),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.black.withOpacity(0.04)),
                            height: 95,
                            width: 150,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Skelton(
                                          height: 10,
                                          width: 100,
                                          radius: 16,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Skelton(
                                          height: 10,
                                          width: 80,
                                          radius: 16,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Skelton(
                                      height: 30,
                                      width: 30,
                                      radius: 16,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                const SizedBox(
                  width: 5,
                ),
                TextButton(
                  onPressed: () {},
                  child: Ink(
                    width: 150,
                    height: 95,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 230, 86, 129),
                          Color(0xffba0f43)
                        ]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'СУЛУУ КОЛ\nЖАЗМА',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'RobotoFlex'),
                                    textAlign: TextAlign.end,
                                  )
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: SvgPicture.asset(
                                      'assets/img/courses2.svg',
                                    ),
                                  )
                                ])
                          ]),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  width: 150,
                  height: 95,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 111, 176, 236),
                        Color(0xff1387f2)
                      ]),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'SMM',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'RobotoFlex'),
                                  textAlign: TextAlign.end,
                                )
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    'assets/img/courses3.svg',
                                  ),
                                )
                              ])
                        ]),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Ink(
                  width: 150,
                  height: 95,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 246, 160, 90),
                        Color(0xffff7b0d)
                      ]),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'FREELANCE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'RobotoFlex'),
                                  textAlign: TextAlign.end,
                                )
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    'assets/img/courses4.svg',
                                  ),
                                )
                              ])
                        ]),
                  ),
                ),
              ],
            )
          ],
        ))
      ],
    ));
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
  });

  final double height, width, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.black.withOpacity(0.04)),
    );
  }
}
