import 'package:get/get.dart';
import 'package:getx_firebase/database/crudProducts.dart';
import 'package:getx_firebase/models/Product.dart';

class ProductController extends GetxController {
  List<Product> products = [];

  Future<void> getAllProduct() async {
    CRUDProducts crudProducts = CRUDProducts();

    final result = await crudProducts.getAllProducts();

    products.addAll(result);
    // print("products :::::::::::::::::::::::::::::::::::: ${products.length}");
    update();
  }

  void toggleFavourite(Product p) {
    p.isFavourite = !p.isFavourite!;
    update();
  }

  List<Product> get getAllFavourite =>
      products.where((element) => element.isFavourite!).toList();
  // get productSubTotla => _products.entries
  //     .map((product) => product.key.price * product.value)
  //     .toList();

  // get productTotal => _products.entries
  //     .map((p) => p.key.price * p.value)
  //     .toList()
  //     .reduce((value, element) => value + element)
  //     .toStringAsFixed(2);
}
