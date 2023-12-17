import 'package:firstapp/constants/api.dart';
import 'package:firstapp/model/meals.dart';
import '../model/movie.dart';
import 'package:dio/dio.dart';


class MovieService{
 static final dio = Dio();
  static Future<List<Movie>> getMovie() async{
    try{
      final response = await dio.get(Api.popularMovie,
      options: Options(
        headers: {
          'Authorization': Api.apiKey
        }
          )
      );
      return (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
    } on DioException catch(err){
      throw '${err.message}';
    }
  }

}


class FoodService{
  static final dio = Dio();

  static Future<List<Food>> getCategory() async{
    try{
      final response = await dio.get('https://www.themealdb.com/api/json/v1/1/categories.php');

      return (response.data['categories'] as List).map((e) => Food.fromJson(e)).toList();
    } on DioException catch(err){
      throw '${err.message}';
    }
  }

  static Future<List<FoodItem>> getFoodItem({
    required String category
}) async{
    try{
      final response = await dio.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');

      return (response.data['meals'] as List).map((e) => FoodItem.fromJson(e)).toList();
    } on DioException catch(err){
      throw '${err.message}';
    }
  }

}