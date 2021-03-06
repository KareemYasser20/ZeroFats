import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zerofats/models/calculate_bmi.dart';
import 'package:zerofats/models/users/user_data.dart';
import 'package:zerofats/services/addUser.dart';
import 'package:zerofats/shared/components/components.dart';
import 'package:zerofats/shared/components/inputText.dart';
import 'package:zerofats/shared/components/textFieldInput.dart';
import 'package:zerofats/modules/home/home_screen.dart';

import '../../constants.dart';

User loggedInUser;

class RegistrationScreen extends StatefulWidget {
  static const String id = 'Register_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameHolder1= TextEditingController();
  final _addUser = AddUser();
  final bmiCalc = CalculateBMI();
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String fName , lName , email , password , confirmPass ;
  int birthYear , weight , height;

  List gender=["Male","Female"];
  String select;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/SignupBackground.png'),
              fit: BoxFit.cover),
        ),

        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.green.shade400,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top:80.0 , right: 15.0 , left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[



                      TextFields(

                          onChanged: (newValue){
                          fName = newValue;
                          // print(F_name);
                        },
                          hintText: 'First name'
                      ),
                      SizedBox(width: 10.0,),

                      TextFields(
                          onChanged: (newValue){
                            lName = newValue;
                            // print(L_name);
                          },
                          hintText: 'Last name'
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'Gender:' ,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),

                      Flexible(
                        child: Radio(
                                activeColor: Colors.white,
                                value: gender[0],
                                groupValue: select,
                                onChanged: (value){
                                setState(() {
                                // print(value);
                                select=value;
                                });
                                },
                      ),
                      ),
                      Text('Male',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),

                      Flexible(
                        flex: 1,
                        child: Radio(
                          activeColor: Colors.white,
                          value: gender[1],
                          groupValue: select,
                          onChanged: (value){
                            setState(() {
                            // print(value);
                            select=value;
                            });
                          },
                        ),

                      ),
                      Text('Female' ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.0,),

                Padding(
                  padding: const EdgeInsets.only(left :15.0 , right: 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Flexible(
                        child: Text('  Year of birth                  ' ,
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ) ,
                        ),
                      ),

                      TextFields(
                        inputType: TextInputType.number,
                          onChanged: (value){
                            birthYear = int.parse(value);
                             // print(birthYear);
                          },
                          hintText: 'Year Of Birth',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.0,),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0 , right: 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      TextFields(
                        inputType: TextInputType.number,
                          onChanged: (heightValue){
                            height = int.parse(heightValue);
                            // print(height);
                          },
                          hintText: 'Height in cm',
                      ),

                      SizedBox(width: 10.0,),

                      TextFields(
                        inputType: TextInputType.number,
                          onChanged: (weightValue){
                            weight = int.parse(weightValue);
                            // print(weight);
                          },
                          hintText: 'Weight in Kg',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.0,),

                 TextFieldsInput(
                   inputType: TextInputType.emailAddress,
                     onChanged: (emailValue){
                              email = emailValue;
                              // print(email);
                             },
                     hintText: 'Email',
                 ),

                SizedBox(height: 10.0,),

                TextFieldsInput(
                    onChanged: (newPass){
                      password = newPass;
                      // print(password);
                    },
                    hintText: 'Password',
                ),

                SizedBox(height: 10.0,),

                TextFieldsInput(
                    onChanged: (newConfirmPass){
                      confirmPass = newConfirmPass;
                      // print(confirmPass);
                    },
                    hintText: 'Confirm Password',
                ),

                SizedBox(height: 10.0,),

                defaultButton(
                    height: 40.0,
                    padding: 0.0,
                    background: KGreenColor,
                    text: 'Register',
                    radius: 35.0,
                  function: ()async{
                    // Register success and go to home screen
                    try {
                      double userBmi = bmiCalc.calculateYourBmi(weight , height);
                      final newUser = await _auth
                          .createUserWithEmailAndPassword(
                          email: email, password: password);
                      print('before if $newUser');
                      if (newUser != null) {
                        _addUser.addUser(UserData(
                          firstName : fName ,
                          lastName: lName ,
                          gender: select,
                          yearOfBirth: birthYear,
                          height: height,
                          weight: weight,
                          email: email,
                          id: _auth.currentUser.uid,
                          bmi:  userBmi,
                          bmiCategory: bmiCalc.bmiCategory(userBmi),
                          steps: null,
                        ),
                        );
                        Navigator.pushNamed(context, HomeScreen.id);
                      }
                    }catch(e){
                      print(e);
                    }
                    // print( 'name${fName + ' ' + lName}');
                    // print('select $select');
                    // print('birthYear $birthYear');
                    // print('height $height');
                    // print('weight $weight' );
                    // print('email $email');
                    // print('password $password');
                    // print('confirmPass $confirmPass');

                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}