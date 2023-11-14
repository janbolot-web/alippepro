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
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Roboto'),
              gradientType: GradientType.linear,
              colors: [
                Color(0xffba0f43),
                Color(0xff157d97),
              ],
            )),
        SizedBox(
          height: 25,
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                child: Column(
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
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Данакер\n мугалим',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xff1b434d),
                          fontFamily: 'Comfortaa'),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                child: Column(
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
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Шар окуу борборлору',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xff1b434d)),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                child: Column(
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
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Автордук методика',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xff1b434d)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                child: Column(
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
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Жылдык тажрыйба',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xff1b434d)),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                child: Column(
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
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Филиал',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xff1b434d)),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                child: Column(
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
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Автордук китеп',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xff1b434d)),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
