import 'dart:convert';

import 'package:alippepro/providers/course_provider.dart';
import 'package:alippepro/providers/user_provider.dart';
import 'package:alippepro/services/course_services.dart';
import 'package:alippepro/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alippepro/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

final DecorationTween _tween = DecorationTween(
  begin: BoxDecoration(
    color: CupertinoColors.systemRed,
    boxShadow: const <BoxShadow>[],
    borderRadius: BorderRadius.circular(20.0),
  ),
  end: BoxDecoration(
    color: CupertinoColors.systemYellow,
    boxShadow: CupertinoContextMenu.kEndBoxShadow,
    borderRadius: BorderRadius.circular(20.0),
  ),
);

Animation<Decoration> _boxDecorationAnimation(Animation<double> animation) {
  return _tween.animate(
    CurvedAnimation(
      parent: animation,
      curve: Interval(
        0.0,
        CupertinoContextMenu.animationOpensAt,
      ),
    ),
  );
}

class _UsersScreenState extends State<UsersScreen> {
  final AuthService authServices = AuthService();
  final CourseService coursesServices = CourseService();
  @override
  void initState() {
    super.initState();

    authServices.getAllUsers(context);
    coursesServices.getCourse(context: context, id: '63a5ad8056d0489148c360e4');
  }

  var combineModules = [];
  List modulesList = [];

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UsersProvider>(context).users.users;
    final modules =
        Provider.of<CourseDetailProvider>(context).courseDetail.modules;

    sortFunc() {
      var seen = Set<String>();
      authServices.getAllUsers(context);
      coursesServices.getCourse(
          context: context, id: '63a5ad8056d0489148c360e4');
      modulesList =
          combineModules.where((student) => seen.add(student['_id'])).toList();
    }

    return SafeArea(
        child: Scaffold(
            body: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        color: Colors.white70,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                users[index]['name'],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                users[index]['email'],
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        )),
                    // onTapCancel: () => modulesList = [],
                    onTap: () {
                      combineModules = [
                        ...users[index]['courses'],
                        ...modules,
                      ];
                      sortFunc();
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Container(
                              color: Colors.white,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      users[index]['name'],
                                      style: TextStyle(
                                          color: Color(0xff054e45),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      users[index]['email'],
                                      style:
                                          TextStyle(color: Color(0xff054e45)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children:
                                          modulesList.map<Widget>((module) {
                                        return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  module['isAccess'] == null
                                                      ? Color(0xff054e45)
                                                      : Colors.red,
                                            ),
                                            onPressed: () async {
                                              await http.patch(
                                                  Uri.parse(
                                                      '${Constants.uri}/addCourseToUser'),
                                                  headers: <String, String>{
                                                    'Content-Type':
                                                        'application/json; charset=UTF-8',
                                                  },
                                                  body: jsonEncode({
                                                    "params": {
                                                      "moduleId": module['_id'],
                                                      "userId": users[index]
                                                          ['_id'],
                                                      "courseId":
                                                          "63a5ad8056d0489148c360e4"
                                                    }
                                                  }));
                                              // coursesServices.addModuleToUser(
                                              //   moduleId: module['_id'],
                                              //   userId: users[index]['_id'],
                                              //   courseId:
                                              //       "63a5ad8056d0489148c360e4",
                                              // );
                                              Navigator.pop(context);
                                            },
                                            child: SizedBox(
                                              width: 200,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    module['name'],
                                                    style: TextStyle(),
                                                  ),
                                                  module['isAccess'] == null
                                                      ? Icon(
                                                          Icons
                                                              .lock_outline_rounded,
                                                          size: 25,
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .lock_open_outlined,
                                                          size: 25,
                                                        ),
                                                ],
                                              ),
                                            ));
                                      }).toList(),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: modules[index]
                                      //                 ['isAccess'] ==
                                      //             false
                                      //         ? Color(0xff054e45)
                                      //         : Colors.red),
                                      child: const Text('Закрыть'),
                                      onPressed: () {
                                        // modulesList[index]['isAccess'] ??
                                    
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                })));
  }
}

// CupertinoContextMenu(

//                       actions: modules.map<Widget>((module) {
//                         return CupertinoContextMenuAction(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           trailingIcon: CupertinoIcons.delete,
//                           child: Text(module['name']),
//                         );
//                       }).toList(),
//                       child: Container(

//                           margin:
//                               EdgeInsets.symmetric(vertical: 10, horizontal: 0),
//                           color: Colors.white70,
//                           padding: EdgeInsets.symmetric(
//                               vertical: 15, horizontal: 20),
//                           child: Container(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   users[index]['name'],
//                                   style: TextStyle(
//                                       fontSize: 16, color: Colors.green),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   users[index]['email'],
//                                   style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontSize: 14,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )));
