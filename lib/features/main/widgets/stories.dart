import 'package:alippepro/providers/story_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_storyboard/flutter_instagram_storyboard.dart';
import 'package:provider/provider.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  Widget _createDummyPage({
    required String text,
    required String imageName,
    bool addBottomBar = true,
  }) {
    return StoryPageScaffold(
      bottomNavigationBar: addBottomBar
          ? SizedBox(
              width: double.infinity,
              height: kBottomNavigationBarHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            50.0,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imageName,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonText(String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildButtonDecoration(
    String imageName,
  ) {
    return BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          imageName,
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  BoxDecoration _buildBorderDecoration(Color color) {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(15.0),
      ),
      border: Border.fromBorderSide(
        BorderSide(
          color: color,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List stories = Provider.of<StoryProvider>(context).story.items;
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(15, 0, 30, 20),
            padding: EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Color.fromARGB(255, 227, 172, 189),
                width: 1.5,
              )),
            ),
            child: Text('Башкы бет',
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff1b434d),
                    fontWeight: FontWeight.w900,
                    fontFamily: 'RobotFlex')),
          ),
          StoryListView(
              pageTransform: const StoryPage3DTransform(),
              buttonDatas: stories
                  .map(
                    (story) => StoryButtonData(
                      timelineFillColor: Colors.blue,
                      timelineBackgroundColor: Colors.white,
                      buttonDecoration: _buildButtonDecoration(
                          story['items'].last['imageUrl']),
                      child: _buildButtonText(''),
                      borderDecoration: _buildBorderDecoration(Color(0xffba0f43)),
                      storyPages: story['items']
                          .map<Widget>((item) => _createDummyPage(
                                text: item['title'],
                                imageName: item['imageUrl'],
                              ))
                          .toList(),
                      segmentDuration: const Duration(seconds: 3),
                    ),
                  )
                  .toList())
        ],
      ),
    );
  }
}


//  StoryListView(
//             pageTransform: const StoryPage3DTransform(),
//             buttonDatas: [
//               StoryButtonData(
//                 timelineFillColor: Colors.blue,
//                 timelineBackgroundColor: Colors.white,
//                 buttonDecoration: _buildButtonDecoration(
//                     'https://i.ibb.co/M9ccP2x/course-Slide3.png'),
//                 child: _buildButtonText(''),
//                 borderDecoration: _buildBorderDecoration(Colors.blue),
//                 storyPages: [
//                   _createDummyPage(
//                     text: 'Салам, Достор!',
//                     imageName: 'https://i.ibb.co/M9ccP2x/course-Slide3.png',
//                   ),
//                   _createDummyPage(
//                     text:
//                         'Can\'t return the loan? Don\'t worry, we\'ll take your soul as a collateral ;-)',
//                     imageName: 'https://i.ibb.co/M9ccP2x/course-Slide3.png',
//                   ),
//                 ],
//                 segmentDuration: const Duration(seconds: 3),
//               ),
//               StoryButtonData(
//                 timelineBackgroundColor: const Color(0xFF2196F3),
//                 buttonDecoration: _buildButtonDecoration(
//                     'https://i.ibb.co/ZHhbX0n/course-Slide1.png'),
//                 borderDecoration: _buildBorderDecoration(
//                     const Color.fromARGB(255, 134, 119, 95)),
//                 child: _buildButtonText(''),
//                 storyPages: [
//                   _createDummyPage(
//                     text: 'Get a loan',
//                     imageName: 'https://i.ibb.co/ZHhbX0n/course-Slide1.png',
//                     addBottomBar: false,
//                   ),
//                   _createDummyPage(
//                     text: 'Select a place where you want to go',
//                     imageName: 'https://i.ibb.co/ZHhbX0n/course-Slide1.png',
//                     addBottomBar: false,
//                   ),
//                   _createDummyPage(
//                     text: 'Dream about the place and pay our interest',
//                     imageName: 'car',
//                     addBottomBar: false,
//                   ),
//                 ],
//                 segmentDuration: const Duration(seconds: 3),
//               ),
//               StoryButtonData(
//                 timelineBackgroundColor: Colors.orange,
//                 borderDecoration: _buildBorderDecoration(Colors.orange),
//                 buttonDecoration: _buildButtonDecoration('car'),
//                 child: _buildButtonText(''),
//                 storyPages: [
//                   _createDummyPage(
//                     text: 'You cannot buy a car. Live with it',
//                     imageName: 'car',
//                   ),
//                 ],
//                 segmentDuration: const Duration(seconds: 5),
//               ),
//               StoryButtonData(
//                 timelineBackgroundColor: Colors.red,
//                 buttonDecoration: _buildButtonDecoration('car'),
//                 child: _buildButtonText(''),
//                 borderDecoration: _buildBorderDecoration(Colors.red),
//                 storyPages: [
//                   _createDummyPage(
//                     text:
//                         'Want to buy a new car? Get our loan for the rest of your life!',
//                     imageName: 'car',
//                   ),
//                   _createDummyPage(
//                     text:
//                         'Can\'t return the loan? Don\'t worry, we\'ll take your soul as a collateral ;-)',
//                     imageName: 'car',
//                   ),
//                 ],
//                 segmentDuration: const Duration(seconds: 3),
//               ),
//               StoryButtonData(
//                 buttonDecoration: _buildButtonDecoration('car'),
//                 borderDecoration: _buildBorderDecoration(
//                     const Color.fromARGB(255, 134, 119, 95)),
//                 child: _buildButtonText(''),
//                 storyPages: [
//                   _createDummyPage(
//                     text: 'Get a loan',
//                     imageName: 'car',
//                     addBottomBar: false,
//                   ),
//                   _createDummyPage(
//                     text: 'Select a place where you want to go',
//                     imageName: 'travel_2',
//                     addBottomBar: false,
//                   ),
//                   _createDummyPage(
//                     text: 'Dream about the place and pay our interest',
//                     imageName: 'travel_3',
//                     addBottomBar: false,
//                   ),
//                 ],
//                 segmentDuration: const Duration(seconds: 3),
//               ),
//               StoryButtonData(
//                 timelineBackgroundColor: Colors.orange,
//                 borderDecoration: _buildBorderDecoration(Colors.orange),
//                 buttonDecoration: _buildButtonDecoration('car'),
//                 child: _buildButtonText(''),
//                 storyPages: [
//                   _createDummyPage(
//                     text: 'You cannot buy a car. Live with it',
//                     imageName: 'car',
//                   ),
//                 ],
//                 segmentDuration: const Duration(seconds: 5),
//               ),
//             ],
//           ),
       