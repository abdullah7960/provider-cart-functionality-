class Product {
  String title;
  String price;
  String images;
  int qty = 1;

  Product(
      {required this.title,
      required this.price,
      required this.images,
      required this.qty});

  factory Product.fromMap(Map map) {
    return Product(
        title: map['title'],
        price: map['price'],
        images: map['images'],
        qty: 1);
  }
}
