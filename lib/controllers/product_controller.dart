import 'package:get/get.dart';
import 'package:ginza_coffee_app/models/product_model.dart';
import 'package:ginza_coffee_app/constans/firebase.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  RxList<ProductModel> product = RxList<ProductModel>([]);
  String collection = "products";

  @override
  void onReady() {
    super.onReady();
    product.bindStream(getAllProducts());
  }

  Stream<List<ProductModel>> getAllProducts() => 
  firebaseFirestore.collection(collection).snapshots().map((query) =>
    query.docs.map((item) => ProductModel.fromMap(item.data())).toList() 
  );

}
  

  