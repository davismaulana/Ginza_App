class ProductModel{
  static const IMAGE = "image";
  static const NAME = "product_name";
  static const PRICE = "price";
  static const DESC = "description";

  String image;
  String name;
  double price;
  String desc;

  ProductModel({this.image, this.name, this.price, this.desc});

  ProductModel.fromMap(Map<String, dynamic> data){

    image = data[IMAGE];
    name = data[NAME];
    desc = data[DESC];
    price = data[PRICE].toDouble();
  }

}