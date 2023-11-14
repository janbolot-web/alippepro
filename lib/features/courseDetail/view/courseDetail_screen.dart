import 'dart:math';

import 'package:alippepro_v1/features/video/video.dart';
import 'package:alippepro_v1/features/videoPlayer/videoPlayer.dart';
import 'package:alippepro_v1/providers/course_provider.dart';
import 'package:alippepro_v1/providers/user_provider.dart';
import 'package:alippepro_v1/services/course_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:text_scroll/text_scroll.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key, required this.idCourse});

  final idCourse;

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  final CourseService courseService = CourseService();

  final _pageController = PageController(initialPage: 1);
  var _selectedPageIndex = 1;
  var dropValue = 0;
  var modules = [];
  List module = [];
  List options = [];

  @override
  void initState() {
    super.initState();
    courseService.getCourse(context: context, id: widget.idCourse);
  }

  @override
  Widget build(BuildContext context) {
    var course = Provider.of<CourseDetailProvider>(context).courseDetail;
    final userCourses = Provider.of<UserProvider>(context).user.courses;

    var combineModules = [...userCourses, ...course.modules];
    var seen = Set<String>();
    modules =
        combineModules.where((module) => seen.add(module['name'])).toList();
    modules.sort((a, b) {
      return a['name']
          .toString()
          .toLowerCase()
          .compareTo(b['name'].toString().toLowerCase());
    });

    final List fixedList = Iterable.generate(modules.length).toList();
    // print(a);
// modules = course.modules;
    if (modules.isNotEmpty) {
      module = modules[dropValue]['lessons'];
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xff054e45),
            ),
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Ink(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 90,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xff3cd8c5), Color(0xff088273)]),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0, left: 20, bottom: 16, right: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/img/courses1.svg',
                                ),
                              )
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                course.title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'RobotoFlex'),
                                textAlign: TextAlign.end,
                              )
                            ]),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              _pageController.animateToPage(0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            });
                          },
                          icon: Icon(
                            Icons.info_outline,
                            size: 35,
                            color: _selectedPageIndex == 0
                                ? const Color(0xff054e45)
                                : const Color(0xffb8c7c5),
                          )),
                    ),
                    IconButton(
                        onPressed: () {
                          _pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        icon: Icon(
                          Icons.apps,
                          size: 35,
                          color: _selectedPageIndex == 1
                              ? const Color(0xff054e45)
                              : const Color(0xffb8c7c5),
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _selectedPageIndex = value;
                      });
                    },
                    children: <Widget>[
                      SingleChildScrollView(child:  Column(children: [
                        Container(
                          margin: EdgeInsets.only(top: 36),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.amber,
                                      width: 1,
                                      style: BorderStyle.solid))),
                          child: ScrollLoopAutoScroll(
                            child: Text(course.title.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff088273),
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w900)),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 50, top: 45),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'КУРС',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xffba0f43),
                                    fontFamily: "Roboto",
                                    fontSize: 36,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'ТУУРАЛУУ',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xff054e45),
                                    fontFamily: "Roboto",
                                    fontSize: 36,
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 36),
                          width: 300,
                          child: Text(
                            course.description.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              color: Color(0xff054e45),
                            ),
                          ),
                        )
                      ]),
                      ),
                     Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color(
                                    0xff1b434d,
                                  ),
                                ),
                                width: 65,
                                height: 25,
                                child: const Text(
                                  "Модуль",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                              const SizedBox(width: 5),
                              // modules[dropValue]['isAccess'] == null ? Text('Lock') : Text('ACCESS'),

                              DropdownButton(
                                value: dropValue,
                                items: fixedList.map((i) {
                                  int a = i;
                                  return DropdownMenuItem(
                                    value: a,
                                    child: Text((i + 1).toString()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    dropValue = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(course.title.toUpperCase(),
                                  style: const TextStyle(
                                      color: Color(0xffb8c7c5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              Text(
                                  ': ${modules[dropValue]['name'].toUpperCase()}',
                                  style: const TextStyle(
                                      color: Color(0xffb8c7c5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.45,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Stack(
                                    children: [
                                      GridView.builder(
                                          itemCount: module.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                          ),
                                          itemBuilder: (context, index) {
                                            return TextButton(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    child: Text(
                                                      module[index]['name'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff1b434d),
                                                        fontSize: 14,
                                                      ),
                                                      // '${index + 1} - сабак'
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Container(
                                                        child: Image.network(
                                                            'https://www.shutterstock.com/shutterstock/photos/1780698029/display_1500/stock-photo-lettering-lesson-on-green-chalkboard-d-illustration-1780698029.jpg')),
                                                  ),
                                                ],
                                              ),
                                              onPressed: () {
                                                // print(module[index]['videoUrl']);
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          // VideoScreen(
                                                          //         videoUrl: module[
                                                          //                 index]
                                                          //             ['videoUrl']
                                                          // ),
                                                          VideoPlayerScreen(
                                                              url:
                                                                  "https://work.220youtube.ru/youtube/cayiHYUM32g/download/22?title=2%20%20%20%D0%A1%D0%B0%D0%B1%D0%B0%D0%BA%20(720p)")),
                                                );
                                              },
                                            );
                                          }),
                                      // Center(
                                      //   child: Container(
                                      //       width: MediaQuery.of(context)
                                      //           .size
                                      //           .width,
                                      //       height: MediaQuery.of(context)
                                      //           .size
                                      //           .height,
                                      //       color: Colors.black54,
                                      //       child: const Icon(Icons.lock_outlined, color: Colors.white, size: 72,)),
                                      // )
                                    ],
                                  )))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        )));
  }
}


//  DropdownButton(
//                                   value: dropValue,
//                                   items: const [
//                                     DropdownMenuItem(
//                                       value: 0,
//                                       child: Text("1"),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 1,
//                                       child: Text("2"),
//                                     ),
//                                     DropdownMenuItem(
//                                         value: 2, child: Text("3")),
//                                     DropdownMenuItem(value: 3, child: Text("4"))
//                                   ],
//                                   onChanged: (value) {
//                                     setState(() {
//                                       dropValue = value!;
//                                     });
//                                   }),