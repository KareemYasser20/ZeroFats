import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zerofats/screens/exercise_screen.dart';
import 'package:zerofats/screens/home_screen.dart';
import 'package:zerofats/screens/login_screen.dart';
import 'package:zerofats/screens/registration_screen.dart';
import 'package:zerofats/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
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


