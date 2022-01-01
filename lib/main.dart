import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zerofats/modules/exercise/exercise_screen.dart';
import 'package:zerofats/modules/home/home_screen.dart';
import 'package:zerofats/modules/login/login_screen.dart';
import 'package:zerofats/modules/register/registration_screen.dart';
import 'package:zerofats/modules/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        HomeScreen.id : (context) => HomeScreen(),
        ExerciseScreen.id : (context) => ExerciseScreen(),


      },
    );
  }
}


