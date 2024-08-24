import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/components/rounded_icon_btn.dart';
import 'package:getx_firebase/controllers/cartController.dart';
import 'package:getx_firebase/models/Cart.dart';
import 'package:getx_firebase/screens/cart/cart_screen.dart';
import '../../models/Product.dart';
import 'components/product_description.dart';
import 'components/product_images.dart';
import 'components/top_rounded_container.dart';

class DetailsScreen extends StatefulWidget {
  // static String routeName = "/details";
  final Product product;
  final int numberOfProduct;
  const DetailsScreen(this.product, this.numberOfProduct, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final CartController cartController = Get.put(CartController());
  int currenrNumber = 1;

  @override
  Widget build(BuildContext context) {
    // final ProductDetailsArguments agrs =
    //     ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    // final product = agrs.product;
    // final numOfProduct = agrs.numOfProduct;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text(
                      widget.product.rating.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset("assets/icons/Star Icon.svg"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          ProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      numberOfProductMethod(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: () {
                final Cart newProduct =
                    Cart(product: widget.product, numOfItem: currenrNumber);
                cartController.addProduct(newProduct);
                print("cart list: ${cartController.cart.length}");

                Get.toNamed("CartScreen");
              },
              child: const Text("Add To Cart"),
            ),
          ),
        ),
      ),
    );
  }

  Widget numberOfProductMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // ...List.generate(
          //   widget.product.colors.length,
          //   (index) => ColorDot(
          //     color: Color(widget.product.colors[index]),
          //     isSelected: index == selectedColor,
          //   ),
          // ),

          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              if (currenrNumber > 1) {
                setState(() {
                  currenrNumber--;
                });
              } else {
                Get.snackbar("decreament number of product",
                    "number of product can't be less than 1",
                    colorText: Colors.green, backgroundColor: Colors.white);
              }
              // final Cart newProduct =
              //     Cart(product: widget.product, numOfItem: widget.numOfProduct);
              // cartController.removeProduct(newProduct);
            },
          ),
          const SizedBox(width: 20),
          Text(currenrNumber.toString()),
          const SizedBox(width: 20),

          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              setState(() {
                currenrNumber++;
              });
              //  final Cart newProduct =
              //     Cart(product: widget.product, numOfItem: widget.numOfProduct);
              // cartController.addProduct(newProduct);
            },
          ),
        ],
      ),
    );
  }
}

// class ProductDetailsArguments {
//   final Product product;
//   final int numOfProduct;
//   ProductDetailsArguments({required this.product, required this.numOfProduct});
// }
