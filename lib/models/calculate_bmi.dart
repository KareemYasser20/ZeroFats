import 'dart:math';

class CalculateBMI{


  double calculateYourBmi(int weight , int height){

    double bmi = (weight/ pow(height,2) )*10000;
    double newBmi = double.parse(bmi.toStringAsFixed(2));
    print('bmi calc = $newBmi');
    // int bmi_int = bmi.toInt();
    return newBmi;

  }

  String bmiCategory (double bmi){
    if(bmi<15){
      return 'Very Severely underweight';
    }else if(bmi>=15 && bmi<16){
      return 'Severely underweight';
    }else if(bmi>=16 && bmi<18.5){
      return 'underweight';
    }else if(bmi>=18.5 && bmi<25){
      return 'Normal';
    }else if(bmi>=25 && bmi<30){
      return 'Overweight';
    }else if(bmi>=30 && bmi<35){
      return 'Moderately obese';
    }else if(bmi>=35 && bmi<40){
      return 'Severely obese';
    }else{
      return 'Very Severely obese';
    }
  }



}