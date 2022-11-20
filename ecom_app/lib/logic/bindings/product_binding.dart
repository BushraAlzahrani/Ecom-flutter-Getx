import 'package:ecom_app/logic/controllers/cart_controller.dart';
import 'package:ecom_app/logic/controllers/product_controller.dart';
import 'package:get/instance_manager.dart';

import '../controllers/category_controller.dart';

class ProductBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
     Get.put(CategoryController());
  }
}