import 'package:flutter/material.dart';
import 'package:zerofats/modules/login/login_screen.dart';
import 'package:zerofats/modules/register/registration_screen.dart';
import 'package:zerofats/shared/components/components.dart';
import '../../constants.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              width: 500.0,
              height: 300.0,
            image: AssetImage('images/logo.jpg'),
              // color: Colors.black,
            ),
            Text('Welcome' ,
              style: TextStyle(
                color: kDarkBlueColor,
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ) ,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 50.0),
              child: Text('We are excited to have you a member '
                  '            in our community' ,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 18.0,
                ) ,
              ),
            ),

            defaultButton(
              text: "login" ,
              radius: 35.0,
              function: (){
                Navigator.pushNamed(context, LoginScreen.id);
              }
            ),

            SizedBox(
              height: 120.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                defaultAskText(),
                defaultRegisterButton(
                  function: (){
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
