import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants.dart';
import 'package:getx_firebase/views/signUp.dart';
import 'package:getx_firebase/widgets/loginWidgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding:const EdgeInsets.only(top: 300),
                height: Constants.mainHeight(context) * 0.5,
                width: Constants.mainWidth(context),
                decoration:const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/loginimg.png"))),
                child:const Padding(
                  padding:  EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 15.0, top: 5),
                        child: Text(
                          "Sign in with your account",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                )),
           const SizedBox(
              height: 10,
            ),
            LoginWidgets.textField(emailController, "Email..", context),
           const SizedBox(
              height: 10,
            ),
            LoginWidgets.textField(passController, "Password..", context),
            const SizedBox(
              height: 10,
            ),
           const Align(
              alignment: Alignment.centerRight,
              
              child: Text(
                "forget password? ",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          const  SizedBox(
              height: 20,
            ),
            Center(child: LoginWidgets.signContainer(SignType.signIn,email: emailController.text,password: passController.text)),
           const SizedBox(
              height: 30,
            ),
            Center(
              child: RichText(
                  text: TextSpan(children: [
               const TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
                TextSpan(
                    text: "Create One",
                    style:const TextStyle(color: Colors.lightBlue, fontSize: 18),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                                  
                        Get.to(() =>const SignUpPage());
                      }),
              ])),
            ),
            GestureDetector(
              
              onTap: () {
                // go to home screen
              },
              child: Center(
                child: Text("Continue without login...",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 17),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
