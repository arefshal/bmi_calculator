import 'package:bmi_calculator/widgets/left_widget.dart';
import 'package:bmi_calculator/widgets/right_widget.dart';
import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  double resultBmi = 0;
  String resultText = "";
  double badResult = 100;
  double goodResult = 100;
  Gender selectedGender = Gender.male; // Default to Male

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("BMI App"),
          elevation: 0,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      child: TextField(
                        controller: weightController,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                            color: Colors.orange.withOpacity(0.8),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: TextField(
                        controller: heightController,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                            color: Colors.orange.withOpacity(0.8),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Gender: "),
                    Radio<Gender>(
                      activeColor: Colors.orange,
                      value: Gender.male,
                      groupValue: selectedGender,
                      onChanged: (Gender? value) {
                        if (value != null) {
                          setState(() {
                            selectedGender = value;
                          });
                        }
                      },
                    ),
                    Text("Male"),
                    Radio<Gender>(
                      activeColor: Colors.orange,
                      value: Gender.female,
                      groupValue: selectedGender,
                      onChanged: (Gender? value) {
                        if (value != null) {
                          setState(() {
                            selectedGender = value;
                          });
                        }
                      },
                    ),
                    Text("Female"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    final weight = double.parse(weightController.text);
                    final height = double.parse(heightController.text);
                    setState(() {
                      resultBmi = weight / (height * height);
                      if (selectedGender == Gender.male) {
                        if (resultBmi < 18.5) {
                          resultText = "Underweight";
                          badResult = 300;
                          goodResult = 30;
                        } else if (resultBmi >= 18.5 && resultBmi < 24.5) {
                          resultText = "Healthy weight";
                          goodResult = 300;
                          badResult = 30;
                        } else if (resultBmi >= 24.5 && resultBmi < 29.9) {
                          resultText = "Overweight";
                          badResult = 300;
                          goodResult = 40;
                        } else {
                          resultText = "Obese";
                          badResult = 300;
                          goodResult = 10;
                        }
                      } else {
                        // Female-specific BMI ranges and results
                        // Adjust these ranges as needed
                        if (resultBmi < 18.5) {
                          resultText = "Underweight (Female)";
                          badResult = 300;
                          goodResult = 30;
                        } else if (resultBmi >= 18.5 && resultBmi < 24.5) {
                          resultText = "Healthy weight (Female)";
                          goodResult = 300;
                          badResult = 30;
                        } else if (resultBmi >= 24.5 && resultBmi < 29.9) {
                          resultText = "Overweight (Female)";
                          badResult = 300;
                          goodResult = 40;
                        } else {
                          resultText = "Obese (Female)";
                          badResult = 300;
                          goodResult = 10;
                        }
                      }
                    });
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${resultBmi.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  resultText,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                RightWidget(width: badResult),
                SizedBox(
                  height: 10,
                ),
                LeftWidget(width: goodResult),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
