import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_firebase/models/Product.dart';

class CRUDProducts {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // Future addProduct(Product product) async {
  //   final CollectionReference _product = db.collection('products');

  //   final myProduct = product.toJson();
  //   await _product.add(myProduct);
  // }
//List<Product>
  Future<List<Product>> getAllProducts() async {
    final CollectionReference _product = db.collection('products');

    // List<QueryDocumentSnapshot>? allProducts;
    List<Map<String, dynamic>> allProducts = [];
    List<Product> myList = [];
    final QuerySnapshot value = await _product.get();

    for (var products in value.docs) {
      allProducts.add(products.data() as Map<String, dynamic>);
    }
    for (var myProduct in allProducts) {
      myList.add(Product.fromJson(myProduct));
    }
    print("my llist products::::::::::::::::: ${myList[0].title}");

    return myList;
    // print(
    //     "all products ::::::::::::::::::::: ${allProducts.docs.first.data()}");
    // return allProducts.docs.;
  }

  Future<void> getProductDetails(String id) async {
    final CollectionReference _product = db.collection('products');

    final productDetails = await _product.doc(id).get();
    print(" products details ::::::::::::::::::::: $productDetails");
    // return product details;
  }
}
