import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './login.dart';
import './training.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Home(),
  ));
}

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
                                'ЭНЕРГИЯ',
                                style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  letterSpacing: 3.0
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
                              TextButton(onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return Login();
                                    }));},
                                child: Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 60.0,
                              ),)
                              ],
                          ),],
                      ),
                    ],
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
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                    return Training();
                  },));},
                  label: Text("Старт!",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,),
                  backgroundColor: Color(0x880000).withOpacity(0.8),),
              ),
            ],),),);
  }
}

// class ListTrainingHands extends State {
//   List<String> list =['first text', 'first text', 'first text', 'first text'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//         Expanded(
//           child: Column(
//             // color: Color(0x242C2F).withOpacity(1),
//             children: [ListView.builder (  //может быть только в контейнере но никак не внутри строки или колонки
//                 itemCount: list.length,
//                 itemBuilder: (BuildContext ctxt, int index) {
//                   return new Text(
//                       style: TextStyle(
//                         fontSize: 27,
//                         color: Colors.white,
//                         fontFamily: 'Roboto',
//                       ),
//                       (index+1).toString()+ " "+list[index]);
//                 }
//             )],
//           ),
//         ));}}

