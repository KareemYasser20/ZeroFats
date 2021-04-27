import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zerofats/models/home_card_data.dart';
import 'package:zerofats/screens/exercise_screen.dart';
import 'package:zerofats/screens/home_card.dart';
import 'package:zerofats/widgets/homeBarColumn.dart';

class HomeScreen extends StatefulWidget {

  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    List<CardData> cards =  <CardData>[
      CardData(title: 'Exercises'
          , icon: AssetImage('images/exercise.png') , onTap: (){
             Navigator.pushNamed(context, ExerciseScreen.id);
      }),
      
      CardData(title: 'Doctors'       , icon: AssetImage('images/doctor.png')),
      CardData(title: 'Gym'           , icon: AssetImage('images/gym.png')),
      CardData(title: 'Health Center' , icon: AssetImage('images/healthcenter.png')),
      CardData(title: 'Restaurant'    , icon: AssetImage('images/restaurant.png')),
      CardData(title: 'Challenge'     , icon: AssetImage('images/challenge.png')),
      CardData(title: 'Measure'       , icon: AssetImage('images/measure.png')),
      CardData(title: 'Community'     , icon: AssetImage('images/chat.png')),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade400,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0 , left: 10.0 , right: 10.0 , bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image(
                        height: 50.0,
                        width: 50.0,
                        image: AssetImage('images/points.png'),
                      ),
                      Text(
                        '0' ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,

                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 88.0,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 36.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 85.0,
                  ),
                  Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                    size: 60.0,
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              height: 90.0,
              child: Padding(
                padding: const EdgeInsets.only(top:18.0 , right: 20.0 , left: 20.0),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween, //Center Row contents horizontally,
                   crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                  children: <Widget>[

                    HomeBarColumn(
                      textValue: '0',
                      text: 'Steps',
                    ),

                    HomeBarColumn(
                      textValue: '120',
                      text: 'Weight',
                    ),

                    HomeBarColumn(
                      textValue: '120',
                      text: 'BMI',
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10.0,),

            Expanded(
              child: GridView.count(
                padding: EdgeInsets.only(right: 8.0 , left: 8.0 , top: 8.0),
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 2.0,
                children:List.generate(cards.length, (index) {
                  return Center(
                    child: HomeCard(
                      card: cards[index],
                    ),
                  );
                }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//  void onStepCount(StepCount event) {
//     print(event);
//     print(_steps);
//     setState(() {
//       _steps = event.steps.toString();
//       print('steps = $_steps');
//     });
//   }
//
//   void onPedestrianStatusChanged(PedestrianStatus event) {
//     print('hi event $event');
//     setState(() {
//       _status = event.status;
//     });
//   }
//
//   void onPedestrianStatusError(error) {
//     print('onPedestrianStatusError: $error');
//     setState(() {
//       _status = 'Pedestrian Status not available';
//     });
//     print(_status);
//   }
//
//   void onStepCountError(error) {
//     print('onStepCountError: $error');
//     setState(() {
//       _steps = 'Step Count not available';
//     });
//   }
//
//   Future<void> initPlatformState() async {
//     _pedestrianStatusStream = await Pedometer.pedestrianStatusStream;
//     _stepCountStream = await Pedometer.stepCountStream;
//
//     // _pedestrianStatusStream.listen(onPedestrianStatusChanged).onError(onPedestrianStatusError);
//     _stepCountStream.listen(onStepCount).onError(onStepCountError);
//
//     if (!mounted) return;
//   }

