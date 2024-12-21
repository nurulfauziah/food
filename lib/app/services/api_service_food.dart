import 'package:dio/dio.dart';
import 'package:food/app/helper/network_helper.dart';
import 'package:food/app/models/response_search_food.dart';

class ApiServiceFood {
  final NetworkHelper _dio = NetworkHelper();

  Future<ResponseSearchFood> fetchFood() async {
    try {
      Response response = await _dio.get(
          'recipes/v2?app_id=9b2ad7c3&app_key=7d63820fb156506db40eef38585cecff&q=nasi goreng');
      return ResponseSearchFood.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }
}
