// import 'package:get/get.dart';
// import 'package:getx_firebase/models/Product.dart';

// class FavouriteController extends GetxController {
//   List<Product> favouriteList = [];



//   void addProduct(Product product) {
//     product.isFavourite = !product.isFavourite!;
//     if (favouriteList.isNotEmpty) {
//       if(product.isFavourite!){

//       }
//     }

//     //   final oldProduct =
//     //       favouriteList.firstWhereOrNull((element) => element.id == product.id);
//     //   if (oldProduct != null) {
//     //     Get.snackbar("Product ", "product already inside favourite list");
//     //   }
//     // } else {
//     //   favouriteList.add(product);
//     //   Get.snackbar("Added new Product ", "Added new product to favourite list");
//     //   favouriteList.obs.refresh();
//     //   print("favourite list: ${favouriteList.obs.value.toString()}");
//     //   // update();
//     // }
//   }

//   void removeProduct(Product product) {
//     // if (_products.containsKey(product)) {
//     //   _products[product] -= 1;
//     // } else {
//     //   _products[product] = 1;
//     // }
//     favouriteList.remove(product);

//     Get.snackbar("removed product from cart ",
//         "${favouriteList.obs.value.toString()} is removed successfully");
//     favouriteList.obs.refresh();
//   }
// }
