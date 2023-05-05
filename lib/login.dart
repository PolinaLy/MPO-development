import 'package:flutter/material.dart';
import './main.dart';
import './profile.dart';

class Login extends StatelessWidget {
  // TextEditingController textController = TextEditingController();
  // String displayText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // crossAxisAlignment: CrossAxisAlignment.start,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/back-main.jpg"),
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
                    ),),],
              ),

              Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Вход',
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
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 32),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  // controller: textController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xF5F5F5).withOpacity(0.2),
                    enabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide(
                        color: Colors.black45,
                      ),
                    ),
                    hintText: 'Введите почту',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xF5F5F5).withOpacity(0.2),
                    enabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide(
                        color: Colors.black45,
                      ),
                    ),
                    hintText: 'Введите Имя',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0x14DB1B).withOpacity(0.5),
                        // ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(180, 50), backgroundColor: Color(0x880000).withOpacity(0.8)
                        ),
                        // shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(width: 1, color: Colors.white)),),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Profile();
                              }));
                        },
                        child: Text(
                          'Войти',
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
            ],),),),);
  }
}