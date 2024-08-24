import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../screens/sign_up/sign_up_screen.dart';

class NoAccountText extends StatefulWidget {

  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  State<NoAccountText> createState() => _NoAccountTextState();
}

class _NoAccountTextState extends State<NoAccountText> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => {
            //save email and password using getx
            Get.to(const SignUpScreen())
          },
          // onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
