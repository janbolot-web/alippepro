import 'package:alippepro/features/videoPlayer/youtubeVideoPlayer.dart';
import 'package:alippepro/providers/course_provider.dart';
import 'package:alippepro/providers/user_provider.dart';
import 'package:alippepro/services/auth_services.dart';
import 'package:alippepro/services/course_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key, required this.idCourse});

  final idCourse;

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  final CourseService courseService = CourseService();
  final AuthService authService = AuthService();

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
    authService.getUserData(context);
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
    if (modules.isNotEmpty) {
      module = modules[dropValue]['lessons'];
    }

    final Uri whatsapp = Uri.parse('https://wa.me/996990859695');
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
                      SingleChildScrollView(
                        child: Column(children: [
                          Container(
                            margin: const EdgeInsets.only(top: 36),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: const BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                                        color: Colors.amber,
                                        width: 1,
                                        style: BorderStyle.solid))),
                            child: ScrollLoopAutoScroll(
                              scrollDirection: Axis.horizontal,
                              child: Text(course.title.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff088273),
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w900)),
                            ),
                          ),
                          Container(
                            child: Image.asset('assets/img/courseInfo.png'),
                          ),
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
                                  courseService.getCourse(
                                      context: context, id: widget.idCourse);
                                  authService.getUserData(context);
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
                                                      '${index + 1} - сабак',
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
                                                        child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 200,
                                                      height: 100,
                                                      color: Colors.blueAccent,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    5.0),
                                                        child: Text(
                                                          module[index]['name'],
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    )),
                                                  ),
                                                ],
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          // VideoPlayerScreen(
                                                          //     url:
                                                          //         "https://work.220youtube.ru/youtube/cayiHYUM32g/download/22?title=2%20%20%20%D0%A1%D0%B0%D0%B1%D0%B0%D0%BA%20(720p)")
                                                          YoutubeVideoPlayer(
                                                              url: module[index]
                                                                  [
                                                                  'youtubeUrl'])),
                                                );
                                              },
                                            );
                                          }),
                                      modules[dropValue]['isAccess'] == false
                                          ? Text('')
                                          : Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              color: Color(
                                                0xff054e45,
                                              ).withOpacity(.65),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 130,
                                                    horizontal: 40),
                                                child: Container(
                                                    color: Colors.white,
                                                    alignment: Alignment.center,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Сизде бул курска доступ жок",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: Color(
                                                                0xffba0f43,
                                                              ),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        TextButton(
                                                          onPressed: () async {
                                                            await launchUrl(
                                                                whatsapp);
                                                          },
                                                          child: Text(
                                                              "Доступ алуу үчүн",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color(
                                                                    0xff1387f2,
                                                                  ))),
                                                        )
                                                      ],
                                                    )),
                                              )),
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