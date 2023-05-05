import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import './profile.dart';
import './main.dart';
import './calendar.dart';

class TrainingCorsetMain extends StatefulWidget {
  @override
  TrainingCorset createState()=> TrainingCorset();
}


class TrainingCorset extends State {
  var _counter = 6;
  late Timer _timer;
  bool countDownComplete = false;

  void _startTimer() {
    _counter = 6;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {if (_counter > 0) {
        _counter --;
      }else {
        countDownComplete = true;
        timer.cancel();
      }});
    }
    );
    _counter = 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.luminosity),
            image: AssetImage("lib/img/corset-max.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child:
        Container (
          height: double.infinity,
          child:
          SingleChildScrollView(
            child:
            Expanded(
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
                                  TextButton(onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return Profile();
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
                    margin: EdgeInsets.only(top: 40, bottom: 20),
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Тренировка на спину',
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
                    margin: EdgeInsets.only(top: 0, bottom: 20),
                    child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                (_counter == 1 || _counter == 6 || _counter == 0)?
                                Text(' ', style: TextStyle(fontSize: 34)):
                                Text('$_counter с',
                                  style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                  ),),]
                          ),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                (_counter == 6 || _counter == 1 || _counter == 0)?
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(250, 50),
                                      backgroundColor:
                                      (_counter == 1)? Color(0x14DB1B).withOpacity(0.8):
                                      Color(0x880000).withOpacity(0.8)),
                                  onPressed: () {
                                    _startTimer();
                                  },
                                  child:
                                  (_counter == 1)? Text(
                                      'Выполнено',
                                      style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      )):
                                  Text(
                                    'Начать',
                                    style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ): Container(height: 50,),]
                          ),
                        ]
                    ),
                  ),

                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('TrainingCorset').snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if(snapshot.hasError) return Text('Что-то пошло не так.');
                        if (!snapshot.hasData) {
                          return const Text('');
                        }
                        final data = snapshot.requireData;

                        return ListView
                            .builder(
                            itemCount: data.size,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return new Container(
                                  margin: EdgeInsets.only(top: 0, bottom: 20, left: 20),
                                  child: Text(
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                      (index + 1).toString() + ". " +
                                          data.docs[index]['Name'] + " " +
                                          data.docs[index]['Count'].toString() + " раз"));
                            }
                        );
                      }
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child:
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(250, 50), backgroundColor: Color(0x242C2F).withOpacity(0.8)),
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
                      // ]
                      // )
                    ),
                  ),],
              ),
            ),
          ),
        ),),
    );
  }
}