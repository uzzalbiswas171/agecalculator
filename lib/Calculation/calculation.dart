import 'package:flutter/material.dart';
import 'package:age_calculator/age_calculator.dart';

class Calculation extends StatefulWidget {
  const Calculation({Key? key}) : super(key: key);

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {

  final _dd = TextEditingController();
  final _mm = TextEditingController();
  final _yyyy = TextEditingController();

  DateDuration ? duration;
  DateDuration ? duration_time;


  Calculation() {
    DateTime birthday = DateTime(int.parse(_yyyy.text.toString()), int.parse(_mm.text.toString()), int.parse(_dd.text.toString()));

    // Find out your age as of today's date 2021-03-08
    duration = AgeCalculator.age(birthday);

    //Find out your age on any given date
    duration = AgeCalculator.age(birthday, today: DateTime.now());
    print(
        'Your age is $duration'); // Your age is Years: 33, Months: 1, Days: 26
    //
    // // Find out when your next birthday will be at 2021-03-08
    duration_time = AgeCalculator.timeToNextBirthday(birthday);
     print('You next birthday will be in $duration_time');
    // // You next birthday will be in Years: 0, Months: 11, Days: 25
    //
    // // Find out when your next birthday will be on any given date
    //  duration = AgeCalculator.timeToNextBirthday(birthday,
    //     fromDate: DateTime(2021, 3, 2));
    //  print('You next birthday will be in $duration');
    // // You next birthday will be in Years: 0, Months: 0, Days: 3
    //
    // // Find out the difference between two dates
    // duration = AgeCalculator.dateDifference(
    //   fromDate: DateTime(2021, 1, 2),
    //   toDate: DateTime(2025, 5, 2),
    // );
    // print('The difference is $duration');
    // // You next birthday will be in Years: 4, Months: 4, Days: 0
    //
    // // Add time to any date
    // DateTime date = AgeCalculator.add(
    //     date: DateTime(2021, 1, 2),
    //     duration: DateDuration(years: 5, months: 2, days: 1));
    // print(date);
    // 2026-03-03 00:00:00.000
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text("Calculate your age"),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.indigo[100],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  margin: EdgeInsets.all(
                    20
                ),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                      borderRadius: BorderRadius.circular(33)
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60,
                        color: Colors.indigo[300],
                        child: Center(child: Text("Enter your date of birth",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),)),
                      ),
                      Container(
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100,
                                height: 60,
                                color: Colors.red,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  controller: _dd,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "dd"),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100,
                                height: 60,
                                color: Colors.greenAccent,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  controller: _mm,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "mm"),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100,
                                height: 60,
                                color: Colors.red,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  controller: _yyyy,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "yyyy"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),



                Container(
                  margin: EdgeInsets.all(20),
                  height: 150,
                  width: double.infinity,

                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.greenAccent[100],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Your Age",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),),
                      Text("$duration",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber[200],
                  ),

                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Your next birthday ",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),),
                      Text("$duration_time",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                ),


                Container(
                    height: 70,
                    width: double.infinity,
                    margin: EdgeInsets.all(
                      20
                    ),
                    child: InkWell(
                      onTap: () {
                        setState((){
                          Calculation();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.greenAccent[100],
                        ),

                        child: Center(
                          child: Text("Calculate",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                        ),
                      ),
                    ),
                ),
              ],
            ),
          )),
    );
  }
}
