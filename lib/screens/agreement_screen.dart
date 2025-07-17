import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orthalign/screens/resource_slider_screen.dart';
class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  bool isChecked = false;
  Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.black;
    }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Image.asset("assets/Images/Toplogo.png"),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Text(
            "This app is intended to illustrate Lantern\'s\nworkflow. This is not intended to take the\nplace of an IFU or surgical technique\nguide.",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Checkbox(value: isChecked, onChanged: (bool? value) {

                if(isChecked) {
                  return;
                }

                setState(() {
                  isChecked = value!;
                });

                if(isChecked) {
                  Timer(Duration(seconds: 3), (){
                    Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder: (context) => ResourceSliderScreen()));
                  });
                }
              },  checkColor: Colors.white, fillColor: WidgetStateProperty.resolveWith(getColor)),
              Text(
                'I understand',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.26),
            ],
          ),
        ],
      ),
    );
  }
}