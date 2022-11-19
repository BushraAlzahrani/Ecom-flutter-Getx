import 'package:ecom_app/models/product_models.dart';
import 'package:ecom_app/utils/my_string.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<List<ProductModel>> getProduct() async {

    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }

  }
}
