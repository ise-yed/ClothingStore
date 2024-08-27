import 'package:clothingstore/data/model/product.dart';
import 'package:clothingstore/utils/http_client.dart';

class ProductServices {
  Future<ProductModel> getDetailScreenData(int id) async {
    var response = await dio.get("products/$id");
    return ProductModel.fromJson(response.data);
  }
}
