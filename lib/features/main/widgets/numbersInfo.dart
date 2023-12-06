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
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: SvgPicture.asset('assets/img/Document.svg'),
                          height: 65,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Countup(
                          begin: 0,
                          end: 2,
                          duration: Duration(seconds: 3),
                          separator: '',
                          style: TextStyle(
                              fontSize: 32,
                              color: Color(0xff1b434d),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                    Text(
                      'Автордук\nкитеп',
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: SvgPicture.asset('assets/img/NProfile.svg'),
                          height: 65,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Countup(
                          begin: 0,
                          end: 10000,
                          duration: Duration(seconds: 3),
                          separator: '',
                          style: TextStyle(
                              fontSize: 28,
                              color: Color(0xff1b434d),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                    Text(
                      'Мугалим менен\nкызматташтык',
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
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: SvgPicture.asset('assets/img/Edit.svg'),
                          height: 65,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Countup(
                          begin: 0,
                          end: 400,
                          duration: Duration(seconds: 3),
                          separator: '',
                          style: TextStyle(
                              fontSize: 32,
                              color: Color(0xff1b434d),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                    Text(
                      'Мугалим жаны\nметодикаларды\nөздөштүрүштү',
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: Image.asset('assets/img/Sharokuu.png'),
                          height: 65,
                        ),
                        Countup(
                          begin: 0,
                          end: 57,
                          duration: Duration(seconds: 3),
                          separator: '',
                          style: TextStyle(
                              fontSize: 28,
                              color: Color(0xff1b434d),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                    Text(
                      'Шар окуу\nборбору',
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
            ],
          ),
        ),
       SizedBox(
          height: 50,
        ), Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: Image.asset('assets/img/Calendar.png'),
                          height: 65,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Countup(
                          begin: 0,
                          end: 5,
                          duration: Duration(seconds: 3),
                          separator: '',
                          style: TextStyle(
                              fontSize: 32,
                              color: Color(0xff1b434d),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                    Text(
                      'Жылдык\nтажырыйба',
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: Image.asset('assets/img/Location.png'),
                          height: 65,
                        ),
                        Countup(
                          begin: 0,
                          end: 2,
                          duration: Duration(seconds: 3),
                          separator: '',
                          style: TextStyle(
                              fontSize: 28,
                              color: Color(0xff1b434d),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                    Text(
                      'Филиал',
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
            ],
          ),
        ),SizedBox(
          height: 50,
        ), 
    Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: Image.asset('assets/img/Activity.png'),
                          height: 65,
                        ),
                        Countup(
                          begin: 0,
                          end: 100,
                          duration: Duration(seconds: 3),
                          separator: '',
                          style: TextStyle(
                              fontSize: 28,
                              color: Color(0xff1b434d),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                    Text(
                      'Мугалим\nкомпьютердик\nсабаттуулугун\nарттырды',
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
            ],
          ),
        ),
      ],
    ));
  }
}
