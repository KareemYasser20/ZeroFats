import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zerofats/constants.dart';
import 'package:zerofats/screens/home_screen.dart';
import 'package:zerofats/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/loginBackground.png'),
                fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
            Padding(
              padding:  EdgeInsets.only(top: 20.0),
              child: Image(
                width: 350.0,
                height: 290.0,
                image: AssetImage('images/logo.png'),
                // color: Colors.black,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          Padding(
            padding: const EdgeInsets.only(top :35.0),
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: KTextFieldDecoration.copyWith(
                    hintText: 'Enter your email'
                ),
              ),
          ),
            SizedBox(
              height: 10.0,
            ),

          TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: KTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'
              ),
            ),




              Container(
                width: 130.0,
                height: 90.0,
                child: Padding(
                  padding:  EdgeInsets.only(top:35.0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.green.shade400,
                    child: Text("login",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),

                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(35.0),
                    ),
                    onPressed: () async {
                      // go to home screen
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      }catch(e){
                        print(e);
                      }

                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('you aren\'t a member?',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
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
                      // go to register screen
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

//decoration: BoxDecoration(
//         image: DecorationImage(
//         image: AssetImage('images/loginBackground.png'),
//          fit: BoxFit.cover,
//     ),
//         ),
//       child: Column(
//         children: <Widget>[
//           Image(
//             width: 350.0,
//             height: 260.0,
//             image: AssetImage('images/logo.jpg'),
//             // color: Colors.black,
//           ),
//           SizedBox(
//             height: 48.0,
//           ),
//           TextField(
//             keyboardType: TextInputType.emailAddress,
//             textAlign: TextAlign.center,
//             onChanged: (value) {
//             },
//             decoration: KTextFieldDecoration.copyWith(
//                 hintText: 'Enter your email'
//             ),
//           ),
//           SizedBox(
//             height: 8.0,
//           ),
//           TextField(
//             obscureText: true,
//             textAlign: TextAlign.center,
//             onChanged: (value) {
//             },
//             decoration: KTextFieldDecoration.copyWith(
//                 hintText: 'Enter your password'
//             ),
//           ),
//         ],
//       ),