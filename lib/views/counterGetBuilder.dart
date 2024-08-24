import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/counterGetBuilderController.dart';

class CounterGetBuilder extends StatelessWidget {
  const CounterGetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<CounterBuilderController>(
          init: CounterBuilderController(),
          builder: (controller) {
          return Row(
            children: [
              Text("Current counter: ${controller.counter}"),
          ElevatedButton(onPressed: (){
            controller.increament();
          }, child: Text("Increament"))
           
            ],
          );
        },),
      ),
    );
  }
}