// import 'package:get/get.dart';
// import 'package:getx_firebase/controllers/cartController.dart';
// import 'package:getx_firebase/models/Cart.dart';
// import 'package:getx_firebase/models/Product.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SaveDataLocally {
//   Future<void> saveCartItem(Cart cartItem) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
// // (json["colors"] as List).map((item) => item as int).toList()
//     // await pref.setStringList("colors",(cartItem.product.colors).map((item) => item as String).toList());
//     await pref.setStringList("images", cartItem.product.images);
//     await pref.setString("id", cartItem.product.id!);
//     await pref.setString("description", cartItem.product.description!);
//     await pref.setBool("isFavourite", cartItem.product.isFavourite!);
//     await pref.setBool("isPopular", cartItem.product.isPopular!);
//     await pref.setDouble("price", cartItem.product.price!);
//     await pref.setDouble("rating", cartItem.product.rating!);
//     await pref.setString("title", cartItem.product.title!);
//     await pref.setInt("numOfItem", cartItem.numOfItem);
//   }

//   Future getcartItem() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     Cart? cart;
//     if (pref.getString("id") != null) {
//       print("cart from local DB : ${pref.getString("description")}");
//       cart = Cart(
//           product: Product(
//               isFavourite: pref.getBool("isFavourite"),
//               isPopular: pref.getBool("isPopular"),
//               rating: pref.getDouble("rating"),
//               id: pref.getString("id")!,
//               images: pref.getStringList("images")!,
//               colors: [0x12556, 0xfffff],
//               title: pref.getString("title"),
//               price: pref.getDouble("price"),
//               description: pref.getString("description")),
//           numOfItem: pref.getInt("numOfItem")!);
//       print("saved cart : ${cart.numOfItem}");
//       CartController cartController = Get.put(CartController());
//       cartController.addProduct(cart);
//       // cart!.product.id = pref.getString("id");
//       // cart!.product.colors = (pref.getStringList("colors") as List).map((item) => item as int).toList();
//       // cart.product.images = ;

//       // cart.product.description = ;
//       // cart.product.isFavourite = pref.getBool("isFavourite");
//       // cart.product.isPopular = pref.getBool("isPopular");
//       // // cart.product.price = ;
//       // cart.product.rating = pref.getDouble("rating");
//       // cart.product.title = ;
//       // cart.numOfItem = ;
//       return cart;
//     } else
//       return null;
//   }
// }
