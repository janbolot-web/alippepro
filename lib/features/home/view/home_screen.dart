import 'package:alippepro/features/courses/courses.dart';
import 'package:alippepro/features/live/live.dart';
import 'package:alippepro/features/main/view/main_screen.dart';
import 'package:alippepro/features/profile/profile.dart';
import 'package:alippepro/features/reviews/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static of(BuildContext context) {}
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedPageIndex = 2;
  final _pageController = PageController(initialPage: 2);

  refresh() {
    setState(() {
      _selectedPageIndex = 3;
    });
  }

  // final tabs = [
  //   ReviewsScreen(),
  //   LiveScreen(),
  //   MainScreen(

  //   ),
  //   CoursesScreen(),
  //   ProfileScreen()
  // ];

  Widget body() {
    switch (_selectedPageIndex) {
      case 0:
        return ReviewsScreen();
      case 1:
        return LiveScreen();
      case 2:
        return MainScreen(
          page: refresh,
        );
      case 3:
        return CoursesScreen();
      case 4:
        return ProfileScreen();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
        ),
        body: body(),
        // body: tabs[_selectedPageIndex],
        // PageView(
        //   controller: _pageController,
        //   onPageChanged: (value) {
        //     setState(() {
        //       _selectedPageIndex = value;
        //     });
        //   },
        //   children: [
        //     ReviewsScreen(),
        //     LiveScreen(),
        //     MainScreen(
        //     ),
        //     CoursesScreen(),
        //     ProfileScreen()
        //   ],
        // ),
        bottomNavigationBar: Container(
          height: 70,
          child: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                _selectedPageIndex = index;
              });
            },
            selectedItemColor: Colors.red,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedPageIndex, // This is all you need!

            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/img/reviews.svg"),
                  label: 'Отзывдар',
                  activeIcon:
                      SvgPicture.asset("assets/img/reviews_active.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/img/live.svg"),
                  label: 'Түз эфир',
                  activeIcon: SvgPicture.asset("assets/img/live_active.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/img/home.svg"),
                  label: 'Башкы бет',
                  activeIcon: SvgPicture.asset("assets/img/home_active.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/img/courses.svg"),
                  label: 'Курстар',
                  activeIcon:
                      SvgPicture.asset("assets/img/courses_active.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/img/profile.svg"),
                  label: 'Жеке кабинет',
                  activeIcon:
                      SvgPicture.asset("assets/img/profile_active.svg")),
            ],
          ),
        ));
  }
}
