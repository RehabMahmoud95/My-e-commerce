import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/authController.dart';
import 'package:getx_firebase/controllers/cartController.dart';
import 'package:getx_firebase/controllers/productController.dart';
import 'package:getx_firebase/helper/saveDataLocally.dart';
import 'package:getx_firebase/screens/sign_in/sign_in_screen.dart';

import '../../cart/cart_screen.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  CartController cartController = Get.put(CartController());

  // SaveDataLocally getData = SaveDataLocally();
  // var savedData;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData.getcartItem().then((value) {
  //     print("cart items::::::::::::::::::::::::::: ${value}");
  //     setState(() {
  //       savedData = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBtnWithCounter(
            svgSrc: "assets/icons/Log out.svg",
            press: () {
              AuthController.instance.logOut().then((value) {
                Get.to(const SignInScreen());
              });
            },
          ),
          const SizedBox(width: 10),
          // IconButton(onPressed:
          // (){

          // }, icon:const CustomSurffixIcon(svgIcon: "assets/icons/Log out.svg")),
          const Expanded(child: SearchField()),
          const SizedBox(width: 16),
          Obx(() {
            return IconBtnWithCounter(
              svgSrc: "assets/icons/Cart Icon.svg",
              press: () => Get.to(CartScreen()),
              numOfitem: cartController.cart.length,
              // Navigator.pushNamed(context, CartScreen.routeName),
            );
          }),
          const SizedBox(width: 8),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            press: () {},
          )
        ],
      ),
    );
  }
}
