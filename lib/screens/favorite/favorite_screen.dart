import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/components/product_card.dart';
import 'package:getx_firebase/controllers/productController.dart';
import 'package:getx_firebase/models/Product.dart';
import '../details/details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            "Favorites",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(child: GetBuilder<ProductController>(
            builder: (productController) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  itemCount: productController.getAllFavourite.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) => ProductCard(
                      product: productController.getAllFavourite[index],
                      onPress: () =>
                          Get.to(DetailsScreen(productController.getAllFavourite[index], 1))
                      // Navigator.pushNamed(
                      //   context,
                      //   DetailsScreen.routeName,
                      //   arguments:
                      //       ProductDetailsArguments(product: demoProducts[index],numOfProduct: 1),
                      // ),
                      ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
