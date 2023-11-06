import 'package:alippepro_v1/features/main/widgets/carousel.dart';
import 'package:alippepro_v1/features/main/widgets/numbersInfo.dart';
import 'package:alippepro_v1/features/main/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var user;

  verificationUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user');
    setState(() {
      user = token;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificationUser();
  }
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stories(),
          Container(
              margin: new EdgeInsets.only(top: 20.0), child: NumbersInfo()),
          Carousel(),
          ElevatedButton(
              onPressed: () {
                print(user);
              },
              child: Text('GET USER Data'))
        ],
      ),
    );
  }
}
