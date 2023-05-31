import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './profile.dart';
import './login.dart';
import './main.dart';
import './training-hands.dart';
import './training-legs.dart';
import './training-corset.dart';

class Training extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0x242C2F).withOpacity(1),
          child: Container (
            // padding: EdgeInsets.only(right: 10, bottom: 10),
            child: Column (
              children: [
                IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, top: 40, right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                ),],
                            ),],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if ((user == null)) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return Login();
                                          }));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return Profile();
                                          }));
                                    }},
                                  child: Icon(
                                    (user == null) ?
                                    Icons.login_outlined : Icons.account_circle,
                                    color: Colors.white,
                                    size: 50.0,
                                  ),)
                              ],
                            ),],
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.luminosity),
                      image: AssetImage("lib/img/hands-max.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return TrainingHandsMain();
                                }));},
                            child: Text(
                              'Руки',
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
                        ]
                    ),
                  ),

                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.luminosity),
                      image: AssetImage("lib/img/legs-max.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return TrainingLegsMain();
                                }));},
                            child: Text(
                              'Ноги',
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
                        ]
                    ),
                  ),

                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.luminosity),
                      image: AssetImage("lib/img/corset3.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return TrainingCorsetMain();
                                }));},
                            child: Text(
                              'Спина',
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
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),),
    );
  }
}