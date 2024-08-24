import 'package:get/get.dart';

class CounterBuilderController extends GetxController {
  int counter = 0;

  void increament() {
    counter++;
    // insteade of stream in getX use update to use this function when need but bindStream in getX make app use more memory
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
