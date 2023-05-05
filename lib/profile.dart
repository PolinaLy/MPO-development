import 'package:flutter/material.dart';
import './main.dart';
import './training.dart';
import './calendar.dart';

class Profile extends StatelessWidget {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/back-profile.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container (
          padding: EdgeInsets.only(left: 2, top: 54, right: 10, bottom: 10),
          child: Column (
            children: [
              Row(
                children: [
                  TextButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Home();
                        }));},
                    child: Text(
                      'ЭНЕРГИЯ',
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          letterSpacing: 3.0
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Профиль',
                        style: TextStyle(
                          fontSize: 27,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ]
                ),
              ),

              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child:
                  Column (
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Имя',
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),

                              SizedBox(
                                width: 10,
                              ),

                              Column(
                                children: [
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 1.5, color: Colors.white),
                                      ),),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                      textAlign: TextAlign.center,

                                    ),
                                  )
                                ],
                              ),
                            ]
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Почта',
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),

                              SizedBox(
                                width: 10,
                              ),

                              Column(
                                children: [
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 1.5, color: Colors.white),
                                      ),),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ]
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Рост',
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),

                              SizedBox(
                                width: 10,
                              ),

                              Column(
                                children: [
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 1.5, color: Colors.white),
                                      ),),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                      textAlign: TextAlign.center,

                                    ),
                                  )
                                ],
                              ),
                            ]
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Вес',
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  ],
                              ),

                              SizedBox(
                                width: 10,
                              ),

                              Column(
                                children: [
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 1.5, color: Colors.white),
                                      ),),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ]
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(250, 50), backgroundColor: Color(0x880000).withOpacity(0.8)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return Training();
                                        }));},
                                  child: Text(
                                    'Тренироваться',
                                    style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0x14DB1B).withOpacity(0.5),
                                  // ),
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(250, 50), backgroundColor: Color(0x242C2F).withOpacity(0.8)),
                                  // shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(width: 1, color: Colors.white)),),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return CalendarMain();
                                        }));},
                                  child: Text(
                                    'Календарь',
                                    style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ]
                  )
              ),
            ],
          ),),),);
  }
}