import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/productController.dart';
import 'package:getx_firebase/database/crudProducts.dart';

import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../details/details_screen.dart';
import '../../products/products_screen.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Popular Products",
            press: () {
              Get.to(const ProductsScreen());
              // Navigator.pushNamed(context, ProductsScreen.routeName);
            },
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              //  (isLoading)
              //     ? CircularProgressIndicator(
              //         color: Colors.white,
              //         backgroundColor: Colors.deepPurple,
              //       )
              //     :
              SizedBox(
            height: MediaQuery.of(context).size.height / 3 + 50,
            child: Row(
              children: [
                GetBuilder(
                    init: ProductController(),
                    builder: (ProductController productController) {
                      print("products length : ${productController.products}");
                      return
                          // Text("product length: ${productController.products.length}");

                          SizedBox(
                        height: 200,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: productController.products.length,
                            itemBuilder: (context, index) {
                              //  (productController.products[index].isPopular!)?
                              return Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: ProductCard(
                                    product: productController.products[index],
                                    onPress: () =>Get.to(DetailsScreen( productController.products[index],1))
                                    //  Navigator.pushNamed(
                                    //   context,
                                    //   DetailsScreen.routeName,
                                    //   arguments: ProductDetailsArguments(
                                    //       product:
                                    //           productController.products[index],
                                    //       numOfProduct: 1),
                                    // ),
                                  ));
                              // :null
                            }),
                      );
                    }),
                const SizedBox(width: 20),
              ],
            ),
          ),
        )
      ],
    );
  }
}
