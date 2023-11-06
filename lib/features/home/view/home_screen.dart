import 'package:alippepro_v1/features/courses/courses.dart';
import 'package:alippepro_v1/features/live/live.dart';
import 'package:alippepro_v1/features/main/main.dart';
import 'package:alippepro_v1/features/profile/profile.dart';
import 'package:alippepro_v1/features/reviews/reviews.dart';
import 'package:alippepro_v1/features/video/view/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  var _selectedPageIndex = 2;
  final _pageController = PageController(initialPage: 2);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon:  SvgPicture.asset("assets/img/notify.svg"),
              tooltip: 'notifications',
              onPressed: () {
              },
            ),
          ],
        ),
        body:PageView(
          controller: _pageController,
          onPageChanged: (value){
            setState(() {
              _selectedPageIndex = value;
            });
          },
          children: const [
            ReviewsScreen(),
            LiveScreen(),
            MainScreen(),
            CoursesScreen(),
            ProfileScreen()
          ],
          
        ),
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            onTap: (int index){
              setState(() {
                _selectedPageIndex = index;
                _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
              });
            },
            selectedItemColor: Colors.red,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedPageIndex,// This is all you need!
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/img/reviews.svg"),label:'',
                  activeIcon:SvgPicture.asset("assets/img/reviews_active.svg") ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/img/live.svg"),label:'',
                  activeIcon:SvgPicture.asset("assets/img/live_active.svg")
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/img/home.svg"),label: '',
                  activeIcon:SvgPicture.asset("assets/img/home_active.svg") ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/img/courses.svg"),label: '',
                  activeIcon:SvgPicture.asset("assets/img/courses_active.svg") ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/img/profile.svg"),label: '',
                  activeIcon:SvgPicture.asset("assets/img/profile_active.svg") ),
            ],),
        )
    );
  }

}