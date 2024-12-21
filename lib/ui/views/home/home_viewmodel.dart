import 'package:dio/dio.dart';
import 'package:food/app/models/response_search_food.dart';
import 'package:food/app/services/api_service_food.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ApiServiceFood _apiServiceFood = ApiServiceFood();
  ResponseSearchFood _food =
      ResponseSearchFood(); // Pastikan untuk memberikan nilai default valid
  ResponseSearchFood get food => _food;

  Future<void> getFood() async {
    setBusy(true);
    try {
      _food = await _apiServiceFood.fetchFood();
    } catch (e) {
      // Handle error, show message, etc.
    }
    setBusy(false);
  }
}
