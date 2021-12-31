import 'package:flutter/material.dart';
import 'package:zerofats/screens/login_screen.dart';
import 'package:zerofats/screens/registration_screen.dart';
import '../constants.dart';

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

            Container(
              width: 130.0,
              height: 90.0,
              child: Padding(
                padding:  EdgeInsets.only(top:35.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: kDarkBlueColor,
                  child: Text("login",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),

                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(35.0),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 120.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Text('you aren\'t a member?',
                style: TextStyle(
                  fontSize: 14.0,
                  color: kDarkBlueColor,
                ),
                ),
                FlatButton(
                  child: Text('Register' ,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.green.shade400,
                  ),
                  ),
                  onPressed: (){
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
