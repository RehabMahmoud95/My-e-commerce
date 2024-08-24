import 'package:get/get.dart';

class UserDataController extends GetxController {
// static UserDataController instance = Get.find();
  var email = "".obs;
  var pass = "".obs;
  
  void saveUserData(String myEmail, String myPass) {
    email = myEmail.obs;
    pass = myPass.obs;
    // update();
  }

  
}
