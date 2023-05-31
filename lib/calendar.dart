import 'package:flutter/material.dart';
import './profile.dart';
import './main.dart';

class CalendarMain extends StatefulWidget {
  @override
  Calendar createState()=> Calendar();
}

class Calendar extends State {
  Color _press = Colors.black.withOpacity(0.3);

  List<String> months =
  ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'];
  var now = new DateTime.now().month;
  var list_day = [];
  // var index_day = new DateTime.now().month.bitLength;//находит индекс сегодняшего дня в месяце
  var index_day = DateTime.now().day;//находит индекс сегодняшего дня в месяце
  var index_day_button = DateTime.now().day-1;
  var count_day = new DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day; //количество дней в текущем месяце
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.luminosity),
                image: AssetImage("lib/img/calendar.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child:
            Container (
              height: double.infinity,
              child:
                SingleChildScrollView(
                  child: Expanded(
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
                                          }));
                                        },
                                          child: Text(
                                            'ЭНЕРГИЯ',
                                            style: TextStyle(
                                              fontSize: 27,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                              fontFamily: 'Roboto',
                                              letterSpacing: 3.0
                                            ),
                                            textAlign: TextAlign.left,),
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
                          margin: EdgeInsets.only(top: 30, bottom: 20),
                          child:
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Календарь тренировок',
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
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          child:
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${months[now-1]}' ,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ]
                          ),
                        ),
                        
                        GridView.count(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            crossAxisCount: 5,
                            children:
                              List.generate(count_day, (index) {
                              return Center(
                                child:
                                ElevatedButton(
                                  style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  backgroundColor:
                                  MaterialStatePropertyAll<Color>(index == index_day_button? Color(0x14DB1B).withOpacity(0.8) : Colors.black.withOpacity(0.3)),
                                  fixedSize: MaterialStateProperty.all(Size(50, 50))),
                                  onPressed: () {},
                                  //   setState(() {
                                  //     if(_press == Colors.black.withOpacity(0.3)){
                                  //       _press = Color(0x14DB1B).withOpacity(0.8);
                                  //     }else{
                                  //       _press = Colors.black.withOpacity(0.3);
                                  //     }
                                  //   });
                                  // },
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [Text(
                                    '${index+1}',
                                    style:
                                      TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                    ),]
                                  ),)
                              );})
                        ),
                      ],
                )
        )))));}}