import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:countup/countup.dart';

class NumbersInfo extends StatelessWidget {
  NumbersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        Center(
            heightFactor: 1,
            child: GradientText(
              'САНДАР\n \t \t \t \t \t \t \t \t \t СҮЙЛӨСҮН',
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w900),
              gradientType: GradientType.linear,
              colors: [
                Color(0xffba0f43),
                Color(0xff157d97),
              ],
            )),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    child: SvgPicture.asset('assets/img/NProfile.svg'),
                    height: 65,
                  ),
                  Countup(
                    begin: 0,
                    end: 350,
                    duration: Duration(seconds: 2),
                    separator: '',
                    style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff1b434d),
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Comfortaa'),
                  ),
                  Text(
                    'Данакер\n мугалим',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff1b434d), fontFamily: 'Comfortaa'),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 65,
                    child: SvgPicture.asset('assets/img/Edit.svg'),
                  ),
                  Countup(
                    begin: 0,
                    end: 57,
                    duration: Duration(seconds: 2),
                    separator: '',
                    style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff1b434d),
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'Шар окуу\n борборлору',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff1b434d)),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: SvgPicture.asset('assets/img/Document.svg'),
                    height: 65,
                  ),
                  Countup(
                    begin: 0,
                    end: 20,
                    duration: Duration(seconds: 2),
                    separator: '',
                    style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff1b434d),
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'Автордук\n методика',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff1b434d)),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      'assets/img/Clock.svg',
                    ),
                    height: 65,
                  ),
                  Countup(
                    begin: 0,
                    end: 3,
                    duration: Duration(seconds: 2),
                    separator: '',
                    style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff1b434d),
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'Жылдык\n тажрыйба',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff1b434d)),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: SvgPicture.asset('assets/img/Location.svg'),
                    height: 50,
                  ),
                  Countup(
                    begin: 0,
                    end: 2,
                    duration: Duration(seconds: 2),
                    separator: '',
                    style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff1b434d),
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'Филиал',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff1b434d)),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: SvgPicture.asset('assets/img/Bookmark.svg'),
                    height: 65,
                  ),
                  Countup(
                    begin: 0,
                    end: 2,
                    duration: Duration(seconds: 2),
                    separator: '',
                    style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff1b434d),
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'Автордук\n китеп',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff1b434d)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
