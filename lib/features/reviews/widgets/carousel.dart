import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/img/photo_1_2023-11-19_16-25-50.png',
  'assets/img/photo_2_2023-11-19_16-25-50.png',
  'assets/img/photo_3_2023-11-19_16-25-50.png',
  'assets/img/photo_4_2023-11-19_16-25-50.png',
  'assets/img/photo_5_2023-11-19_16-25-50.png',
  'assets/img/photo_6_2023-11-19_16-25-50.png',
  'assets/img/photo_7_2023-11-19_16-25-50.png',
  'assets/img/photo_8_2023-11-19_16-25-50.png',
  'assets/img/photo_9_2023-11-19_16-25-50.png',
];

class Carousel extends StatefulWidget {
  Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselController _controller = CarouselController();
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: Image.asset(
              item,
              fit: BoxFit.cover,
              width: 1000.0,
              height: 1000,
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(enlargeCenterPage: true, height: 350),
          items: imageSliders,
          carouselController: _controller,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: <Widget>[
        //     Flexible(
        //       child: ElevatedButton(
        //         onPressed: () => _controller.previousPage(),
        //         child: Text('←'),
        //       ),
        //     ),
        //     Flexible(
        //       child: ElevatedButton(
        //         onPressed: () => _controller.nextPage(),
        //         child: Text('→'),
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
