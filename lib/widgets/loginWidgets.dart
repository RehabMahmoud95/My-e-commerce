import 'package:flutter/material.dart';
import 'package:getx_firebase/constants.dart';
import 'package:getx_firebase/controllers/authController.dart';

class LoginWidgets {
  static Widget textField(
      TextEditingController controller, String hint, BuildContext context,
      {String type = ""}) {
    // BuildContext _context = context;
    return Center(
      child: Material(
        elevation: 2,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: Constants.mainWidth(context) - 40,
          child: TextField(
            controller: controller,
            obscureText: (hint != "Email..") ? true : false,
            decoration: InputDecoration(
              prefixIcon: (type == "signUp")
                  ? (hint == "Email..")
                      ? const Icon(
                          Icons.email,
                          color: Colors.lightBlueAccent,
                        )
                      : const Icon(
                          Icons.password,
                          color: Colors.lightBlueAccent,
                        )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey),
              hintText: hint,
              fillColor: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }

  static Widget signContainer(SignType signType,
      {String email = "", String password = ""}) {
    return InkWell(
      onTap: () {
        if (signType == SignType.signUp) {
          AuthController.instance.register(email.trim(), password.trim());
        } else if (signType == SignType.signIn) {
          AuthController.instance.login(email.trim(), password.trim());
        } else {
          AuthController.instance.logOut();
        }
      },
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            signType.name,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  static Widget socialMediaContainer(String imgUrl, String type) {
    return InkWell(
      onTap: () {
        if (type == "f") {
        } else if (type == "g") {
         AuthController.instance.googleSignUp();
        } else {}
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        backgroundImage: AssetImage(imgUrl),
      ),
    );
    // Container(

    //   padding: EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     shape: BoxShape.circle,
    //     border: Border.all(color: Colors.blueGrey)
    //   ),
    //   child: Center(child: Image(
    //     height:40 ,width: 40,
    //     fit: BoxFit.contain, image: AssetImage(imgUrl))),
    // );
  }

  
}
