import 'package:flutter/material.dart';
import 'package:getx_firebase/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Container(
            height: Constants.mainHeight(context) *0.5,
            width: Constants.mainWidth(context),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(image: AssetImage("assets/signup.png"),
              fit: BoxFit.fill
              )
            ),
          
          ),
      Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          backgroundColor: Colors.lightBlueAccent,
        ),
      )
        ],
      ),
    );
  }
}