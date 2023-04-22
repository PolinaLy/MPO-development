import 'package:flutter/material.dart';

void main() =>
  // runApp(const MyApp());
  runApp(MaterialApp(
    // home: Home(),
      home: Login(),
  ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/img/back-main.jpg"),
              fit: BoxFit.cover,
            ),
          ),

          child: Column (
            children: [
              IntrinsicHeight(
                child: Container(
                  // color: Color.fromRGBO(000, 000, 000, 0.5),
                  padding: EdgeInsets.only(left: 10, top: 40, right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Энергия',
                                style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                ),
                                textAlign: TextAlign.left,
                              ),],
                          ),],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                // Icons.account_circle_outlined,
                                Icons.account_circle,
                                color: Colors.white,
                                size: 60.0,
                              ),],
                          ),],
                      ),],
                  ),
                ),
              ),

              Container(
                color: Color.fromRGBO(000, 000, 000, 0.4),
                margin: EdgeInsets.only(top: 140),
                child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Если вы не идете до конца,\n зачем вообще идти?',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),

              Container(
                color: Color.fromRGBO(000, 000, 000, 0.4),
                padding: EdgeInsets.only(top: 20, right: 20),
                child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Джо Намат',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ]),
              ),

              Container(
                margin: EdgeInsets.only(top: 120),
                width: 140.0,
                height: 140.0,
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  label: Text("Старт!",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,),
                  backgroundColor: Colors.red,),
              ),],
          )
      ),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/img/back-main.jpg"),
              fit: BoxFit.cover,
            ),
          ),

          child: Column (
            children: [
              IntrinsicHeight(
                child: Container(
                  // color: Color.fromRGBO(000, 000, 000, 0.5),
                  padding: EdgeInsets.only(left: 10, top: 40, right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Энергия',
                                style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                ),
                                textAlign: TextAlign.left,
                              ),],
                          ),],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.account_balance_outlined,
                                color: Colors.white,
                                size: 60.0,
                              ),],
                          ),],
                      ),],
                  ),
                ),
              ),
            ],
    ),
      ),
    );
  }
}

