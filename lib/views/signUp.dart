import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants.dart';
import 'package:getx_firebase/widgets/loginWidgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                height: Constants.mainHeight(context) * 0.5,
                width: Constants.mainWidth(context),
                decoration:const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/signup.png"))),
                child:const Padding(
                  padding:  EdgeInsets.only(top: 200),
                  child: Center(
                      child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.lightBlueAccent,
                    backgroundImage: AssetImage(
                      "assets/profile1.png",
                    ),
                  )),
                ),
              ),
              LoginWidgets.textField(emailController, "Email..", context,
                  type: "signUp"),
              SizedBox(
                height: Constants.mainHeight(context) * 0.02,
              ),
              LoginWidgets.textField(passController, "Password..", context,
                  type: "signUp"),
              SizedBox(
                height: Constants.mainHeight(context) * 0.02,
              ),
              Center(child: LoginWidgets.signContainer(SignType.signUp,email: emailController.text,password: passController.text)),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child:const Text(
                    "have an account ?",
                    style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: Constants.mainHeight(context) * 0.05,
              ),
              const Center(
                child: Text(
                  "Sign up using one of the following ",
                  style: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: Constants.mainHeight(context) * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoginWidgets.socialMediaContainer("assets/f.png","f"),
                  LoginWidgets.socialMediaContainer("assets/g.png","g"),
                  LoginWidgets.socialMediaContainer("assets/t.png","t"),
                ],
              )
            ],
          ),
        ));
  }
}
