import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants.dart';
import 'package:getx_firebase/controllers/authController.dart';
import 'package:getx_firebase/controllers/productController.dart';
import 'package:getx_firebase/helper/saveDataLocally.dart';
import 'package:getx_firebase/screens/cart/cart_screen.dart';
import 'package:getx_firebase/screens/home/components/popular_product.dart';
import 'package:getx_firebase/screens/home/home_screen.dart';
// import 'package:getx_firebase/routes.dart';
import 'screens/splash/splash_screen.dart';

void main() async {
  // binding method to wait action done then login to system(or app)
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDo9AZm5QBa0NKnnNkyjOe7kYebyk-W4pw',
    appId: '1:877180815712:android:cd9ca30a4de0d218a0f605',
    messagingSenderId: 'sendid',
    projectId: 'getx-firebase-da5cc',
    storageBucket: 'getx-firebase-da5cc.appspot.com',
  )).then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ProductController productController = Get.put(ProductController());
  // SaveDataLocally saveDataLocally = SaveDataLocally();
  @override
  void initState() {
    super.initState();
    productController.getAllProduct().then((value) {
      // saveDataLocally.getcartItem().then((value) {
      //   print("${value}");
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GetX and Firebase",
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Muli",
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: kTextColor),
            bodyMedium: TextStyle(color: kTextColor),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      // home: SplashScreen(),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => SplashScreen(),
        ),
        GetPage(
          name: "/HomeScreen",
          page: () => HomeScreen(),
        ),
        GetPage(
          name: "/PopularProducts",
          page: () => PopularProducts(),
        ),
        GetPage(
          name: "/CartScreen",
          page: () => CartScreen(),
        ),
      ],
      // initialBinding: BindingsBuilder(() {
      //   ProductController();
      // }),
      // initialRoute: SplashScreen.routeName,
      // routes: routes,
      //  initialBinding: BindingsBuilder(() {
      //   // Bind the Controller to the Get instance
      //   Get.put(ProductController());
      // }),
    );
  }
}
