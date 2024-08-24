import 'package:get/get.dart';
import 'package:getx_firebase/helper/saveDataLocally.dart';
import 'package:getx_firebase/models/Cart.dart';

class CartController extends GetxController {
  List<Cart> cart = <Cart>[].obs;

  double totalPrice = 0.0;

  void addProduct(Cart product) {
    if (cart.isNotEmpty) {
      print("cart list: ${cart.first.product.id}");
      final oldProduct = cart.firstWhereOrNull(
          (element) => element.product.id == product.product.id);
      if (oldProduct != null) {
        print("old product ${oldProduct.numOfItem}");
        oldProduct.numOfItem += product.numOfItem;
        Get.snackbar("Product ", "increased number of product");
        totalPrice = totalPrice + (product.product.price! * product.numOfItem);
        // saveDataLocally.saveCartItem(oldProduct);
        cart.obs.refresh();
        update();
        //  saveListCartLocally().then((value) {
        //   Get.snackbar("Added new Product ",
        //       "Added new product to cart, total price is: ${totalPrice}");
         
        // });
      } else {
        cart.add(product);
        totalPrice = totalPrice + (product.product.price! * product.numOfItem);
        cart.obs.refresh();
        update();
        // save list of cart locally
        //  saveListCartLocally().then((value) {
        //   Get.snackbar("Added new Product ",
        //       "Added new product to cart, total price is: ${totalPrice}");
         
        // });
       
      }
    } else {
      cart.add(product);
      totalPrice = totalPrice + (product.product.price! * product.numOfItem);
    cart.obs.refresh();
        update();
      // saveListCartLocally().then((value) {
      //     Get.snackbar("Added new Product ",
      //         "Added new product to cart, total price is: ${totalPrice}");
         
      //   });
    }
  }

  void removeFromCart(Cart product) {
    // if (_products.containsKey(product)) {
    //   _products[product] -= 1;
    // } else {
    //   _products[product] = 1;
    // }
    if (product.numOfItem > 1) {
      product.numOfItem--;
      cart.obs.refresh();
      totalPrice = totalPrice - (product.numOfItem * product.product.price!);
      update();
      Get.snackbar("reduce number of item to: ", "${product.numOfItem}");
    } else {
      cart.remove(product);
      Get.snackbar("removed product from cart ",
          "${cart.obs.value.toString()} is removed successfully");

      cart.obs.refresh();
      totalPrice = totalPrice - (product.product.price!);
      update();
    }
  }

  // Future<void> saveListCartLocally() async {
  //   final SaveDataLocally saveDataLocally = SaveDataLocally();
  //   for (Cart myCartItem in cart) {
  //     print("saved data ${myCartItem.numOfItem}");

  //     await saveDataLocally.saveCartItem(myCartItem);
  //   }
  // }
}
