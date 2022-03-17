import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zerofats/models/home_card_data.dart';
import 'package:zerofats/modules/exercise/exercise_screen.dart';
import 'package:zerofats/screens/home_card.dart';
import 'package:zerofats/widgets/homeBarColumn.dart';

class HomeScreen extends StatefulWidget {

  static const String id = 'home_screen';


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String returnSteps , returnWeight , returnBmi;
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<DocumentSnapshot> test;
  Future<void> getUser() async {
    CollectionReference collectionReference =FirebaseFirestore.instance.collection('Users');
    await collectionReference.where("UserID", isEqualTo: auth.currentUser.uid).get().then((value) {
      test = value.docs;
    });
    setState(() {
     returnSteps =  test[0].data()['Steps'].toString();
     returnWeight = test[0].data()['Weight'].toString();
     returnBmi = test[0].data()['BMi'].toString();
    });
    // print('test values step= : $returnSteps');
    // print('test values we = : $returnWeight');
    // print('test values bmi = : $returnBmi');
    // print('test len = : ${test.length}');
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

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
                child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        HomeBarColumn(
                          textValue: returnSteps ?? '0',
                          text: 'Steps',
                        ),

                        HomeBarColumn(
                          textValue: returnWeight ?? '0',
                          text: 'Weight',
                        ),

                        HomeBarColumn(
                          textValue: returnBmi ?? '0',
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
