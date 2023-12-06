import 'package:flutter/material.dart';

class LiveListScreen extends StatelessWidget {
  const LiveListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LiveListDetail(),
                ),
              );
            },
            child: Image.asset(
              'assets/img/potok.png',
              width: 110,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Image.asset(
              'assets/img/potok1.png',
              width: 110,
            ),
          ),
        ])
      ]),
    );
  }
}

class LiveListDetail extends StatelessWidget {
  const LiveListDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/potokHeader.png',
              width: 300,
              height: 60,
            )
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/liveImage.png',
              width: 100,
            ),
            Image.asset(
              'assets/img/liveImage.png',
              width: 100,
            ),
            Image.asset(
              'assets/img/liveImage.png',
              width: 100,
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/liveImage.png',
              width: 100,
            ),
            Image.asset(
              'assets/img/liveImage.png',
              width: 100,
            ),
            Image.asset(
              'assets/img/liveImage.png',
              width: 100,
            )
          ],
        )
      ]),
    );
  }
}
