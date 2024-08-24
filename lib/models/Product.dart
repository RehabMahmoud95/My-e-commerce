class Product {
  String? id;
  String? title, description;
  List<String> images = [];
  List<int> colors = [];
  double? rating, price;
  bool? isFavourite, isPopular;

  Product({
    this.id = "",
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    title = json['title'];
    description = json['description'];
    price = json["price"];
    images  =  (json['images'] as List).map((item) => item as String).toList() ;
    colors =   (json["colors"] as List).map((item) => item as int).toList() ;
    rating = json["rating"];
     isFavourite = json["isFavourite"];
    isPopular = json["isPopular"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;

    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['images'] = this.images;
    data['colors'] = this.colors;
    data['rating'] = this.rating;
    data['isFavourite'] = this.isFavourite;
    data['isPopular'] = this.isPopular;

    return data;
  }
// Our demo Products
}

// List<Product> demoProducts = [
//   Product(
//     id: "1",
//     images: [
//       "assets/images/ps4_console_white_1.png",
//       "assets/images/ps4_console_white_2.png",
//       "assets/images/ps4_console_white_3.png",
//       "assets/images/ps4_console_white_4.png",
//     ],
//     colors: [
//       "red", "green", "yellow", "blue"
//       // const Color(0xFFF6625E),
//       // const Color(0xFF836DB8),
//       // const Color(0xFFDECB9C),
//       // Colors.white,
//     ],
//     title: "Wireless Controller for PS4™",
//     price: 64.99,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: "2",
//     images: [
//       "assets/images/Image Popular Product 2.png",
//     ],
//     colors: [
//       "red", "green", "yellow", "blue"
//       // const Color(0xFFF6625E),
//       // const Color(0xFF836DB8),
//       // const Color(0xFFDECB9C),
//       // Colors.white,
//     ],
//     title: "Nike Sport White - Man Pant",
//     price: 50.5,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Product(
//     id: "3",
//     images: [
//       "assets/images/glap.png",
//     ],
//     colors: [
//       "red", "green", "yellow", "blue"
//       // const Color(0xFFF6625E),
//       // const Color(0xFF836DB8),
//       // const Color(0xFFDECB9C),
//       // Colors.white,
//     ],
//     title: "Gloves XC Omega - Polygon",
//     price: 36.55,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: "4",
//     images: [
//       "assets/images/wireless headset.png",
//     ],
//     colors: [
//       "red", "green", "yellow", "blue"
//       // const Color(0xFFF6625E),
//       // const Color(0xFF836DB8),
//       // const Color(0xFFDECB9C),
//       // Colors.white,
//     ],
//     title: "Logitech Head",
//     price: 20.20,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//   ),
//   Product(
//     id: "1",
//     images: [
//       "assets/images/ps4_console_white_1.png",
//       "assets/images/ps4_console_white_2.png",
//       "assets/images/ps4_console_white_3.png",
//       "assets/images/ps4_console_white_4.png",
//     ],
//     colors: [
//       "red", "green", "yellow", "blue"
//       // const Color(0xFFF6625E),
//       // const Color(0xFF836DB8),
//       // const Color(0xFFDECB9C),
//       // Colors.white,
//     ],
//     title: "Wireless Controller for PS4™",
//     price: 64.99,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: "2",
//     images: [
//       "assets/images/Image Popular Product 2.png",
//     ],
//     colors: [
//       "red", "green", "yellow", "blue"
//       // const Color(0xFFF6625E),
//       // const Color(0xFF836DB8),
//       // const Color(0xFFDECB9C),
//       // Colors.white,
//     ],
//     title: "Nike Sport White - Man Pant",
//     price: 50.5,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Product(
//     id: "3",
//     images: [
//       "assets/images/glap.png",
//     ],
//     colors: [
//       "red", "green", "yellow", "blue"
//       // const Color(0xFFF6625E),
//       // const Color(0xFF836DB8),
//       // const Color(0xFFDECB9C),
//       // Colors.white,
//     ],
//     title: "Gloves XC Omega - Polygon",
//     price: 36.55,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: '4',
//     images: [
//       "assets/images/wireless headset.png",
//     ],
//     colors: [
//       "red", "green", "yellow", "blue"
//       // const Color(0xFFF6625E),
//       // const Color(0xFF836DB8),
//       // const Color(0xFFDECB9C),
//       // Colors.white,
//     ],
//     title: "Logitech Head",
//     price: 20.20,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//   ),
// ];

// const String description =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
