import 'package:clothingstore/data/model/home.dart';
import 'package:clothingstore/utils/http_client.dart';

class HomeServices {
  Future<HomeModel> getHomeData() async {
    var response = await dio.get('home');
    return HomeModel.fromJson(response.data);
  }
}
