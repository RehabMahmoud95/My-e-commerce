// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_firebase/controllers/cartController.dart';
// import 'package:getx_firebase/models/Cart.dart';

// import '../../../components/rounded_icon_btn.dart';
// import '../../../constants.dart';
// import '../../../models/Product.dart';

// class ColorDots extends StatefulWidget {
//   ColorDots({Key? key, required this.product, required this.numOfProduct})
//       : super(key: key);

//   final Product product;
//   int numOfProduct;

//   @override
//   State<ColorDots> createState() => _ColorDotsState();
// }

// class _ColorDotsState extends State<ColorDots> {
//   CartController cartController = Get.find();
//   // int currentNumbrt = 1;
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   setState(() {
//   //     currentNumbrt = widget.numOfProduct;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // Now this is fixed and only for demo
//     int selectedColor = 3;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: [
//           // ...List.generate(
//           //   widget.product.colors.length,
//           //   (index) => ColorDot(
//           //     color: Color(widget.product.colors[index]),
//           //     isSelected: index == selectedColor,
//           //   ),
//           // ),

//           RoundedIconBtn(
//             icon: Icons.remove,
//             press: () {
//               final Cart newProduct =
//                   Cart(product: widget.product, numOfItem: widget.numOfProduct);
//               cartController.removeProduct(newProduct);
//             },
//           ),
//           const SizedBox(width: 20),
//           Text(widget.numOfProduct.toString()),
//           const SizedBox(width: 20),

//           RoundedIconBtn(
//             icon: Icons.add,
//             showShadow: true,
//             press: () {
//               setState(() {
                
//               });
//               //  final Cart newProduct =
//               //     Cart(product: widget.product, numOfItem: widget.numOfProduct);
//               // cartController.addProduct(newProduct);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ColorDot extends StatelessWidget {
//   const ColorDot({
//     Key? key,
//     required this.color,
//     this.isSelected = false,
//   }) : super(key: key);

//   final Color color;
//   final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(right: 2),
//       padding: const EdgeInsets.all(8),
//       height: 40,
//       width: 40,
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         border:
//             Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
//         shape: BoxShape.circle,
//       ),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }
