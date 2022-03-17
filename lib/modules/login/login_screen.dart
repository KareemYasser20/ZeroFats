import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zerofats/constants.dart';
import 'package:zerofats/modules/home/home_screen.dart';
import 'package:zerofats/modules/register/registration_screen.dart';
import 'package:zerofats/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
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
          child: Form(
            key: formKey,
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
              child: defaultFormField(
                controller: emailController,
                labelText: 'Enter your email',
                type: TextInputType.emailAddress,
                validate: (value){
                    if(value.isEmpty){
                      return 'Email Address must not be empty';
                    }
                    return null;
                },
                onchange: (value) {
                      email = value;
                    },

              ),

            ),
              SizedBox(
                height: 10.0,
              ),

              defaultFormField(
                controller: passwordController,
                isPassword: true,
                onchange: (value) {
                  password = value;
                },
                type: TextInputType.visiblePassword,
                validate: (value){
                  if(value.isEmpty){
                    return 'Password must not be empty';
                  }
                  return null;
                },
                labelText: 'Enter your password'
            ),


                defaultButton(
                    text: "login" ,
                    radius: 35.0,
                    background: KGreenColor,
                    function: () async {
                      // go to home screen

                      if(formKey.currentState.validate()){
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.pushNamed(context, HomeScreen.id);
                          }
                        }catch(e){
                          print(e);
                        }
                      }

                    },
                ),

                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    defaultAskText( textColor: Colors.white),
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
        ),
      ),
    );
  }
}