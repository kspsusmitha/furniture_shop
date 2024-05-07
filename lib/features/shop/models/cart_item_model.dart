class CartItemModel {
  String? id;
  // String? productId;
  String? name;
  String? image;
  String? price;
//required this.productId
  var allitems = [];
  CartItemModel({required this.name, required this.image, this.price, this.id});

  Map toJson()=> {
    
      // "productId":productId,
      "name": name,
      "image": image,
      "price": price
    
  };

  // factory 
  CartItemModel.fromjson(Map<String, dynamic> json) {
    id=json["id"];
    name=json["name"];
    image=json["image"];
    price=json["price"];
  //   return CartItemModel(
  //       name: json["name"], image: json["image"], price: json["price"]);
  // }
  //productId: json["productId"]
}
}