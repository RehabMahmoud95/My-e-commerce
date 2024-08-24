import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:getx_firebase/constants.dart';
// import 'package:getx_firebase/views/loginPage.dart';
import 'package:getx_firebase/widgets/loginWidgets.dart';

class WelcomePage extends StatelessWidget {
  final String email;
 const WelcomePage(this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: Constants.mainHeight(context) * 0.45,
                width: Constants.mainWidth(context),
                decoration:const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/signup.png")))),
            // SizedBox(
            //   height: Constants.mainHeight(context) * 0.05,
            // ),
            const Padding(
              padding: EdgeInsets.only(left: 20,bottom:10),
              child: Text(
                "You Are Welcome",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // SizedBox(
            //   height: Constants.mainHeight(context) * 0.12,
            // ),
            Padding(
              padding:const EdgeInsets.only(left: 20,bottom:10),
              child: Text(
                email,
                style:const TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            SizedBox(
              height: Constants.mainHeight(context) * 0.18,
            ),
            LoginWidgets.signContainer(SignType.signOut)
          ],
        ),
      ),
      //  Obx(
      //   () {
      //     return ;
      //   },
      // )
      // Container(height: MediaQuery.of(context).size.height,
      //           width: MediaQuery.of(context).size.width,
      //       decoration: BoxDecoration(
      //         image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/signup.png"))
      //       ),
    );
  }
}
