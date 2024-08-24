import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/components/product_card.dart';
import 'package:getx_firebase/controllers/productController.dart';
import 'package:getx_firebase/database/crudProducts.dart';
import 'package:getx_firebase/models/Product.dart';
import '../details/details_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  static String routeName = "/products";

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  CRUDProducts crudProducts = CRUDProducts();
  List<Product> myProducts = [];
  // bool isLoading = true;
  // final ProductController productController = Get.find();
  // final ProductController allProducts = Get.find();

  // @override
  // void initState() {
  //   super.initState();
  //   productController.getAllProduct().then((value) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     print("products from get x : ${productController.products.toString()}");
  //   });

  //   // crudProducts.getAllProducts().then((value) {
  //   //   print("Done ::::::::::::::::::::::::::");
  //   //   setState(() {
  //   //     isLoading = false;
  //   //     myProducts = value;
  //   //     print(myProducts[0].title);
  //   //   });
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SafeArea(
        child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  // (isLoading)
                  //     ? const CircularProgressIndicator(
                  //         color: Colors.white,
                  //       ):
                            GetBuilder(
                    init: ProductController(),
                    builder: (ProductController productController) {
                      print("products length : ${productController.products}");
                      return
                  GridView.builder(
                itemCount: productController.products.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  print("current product : " +
                      productController.products.length.toString());
                  return ProductCard(
                    //.keys.toList()[index]
                    product: productController.products[index],
                    onPress: () => Get.to(DetailsScreen(productController.products[index],1))
                    // Navigator.pushNamed(
                    //   context,
                    //   DetailsScreen.routeName,
                    //   arguments: ProductDetailsArguments(
                    //       product: productController.products[index],numOfProduct: 1),
                    // ),
                  );
                },
              );
                    })
            ),
        ),
      
    );
  }
}
