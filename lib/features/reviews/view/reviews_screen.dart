import 'package:alippepro/features/reviews/widgets/carousel.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 14),
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: Color(0xffba0f43),
                  width: 1.5,
                )),
              ),
              child: const Text('Отзыв',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      color: Color(0xff1b434d),
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 45,
            ),
            Carousel(),
          ],
        ),
      ),
    );
  }
}
