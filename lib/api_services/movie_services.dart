import 'package:firstapp/constants/api.dart';
import 'package:firstapp/model/video.dart';
import '../model/movie.dart';
import 'package:dio/dio.dart';


class MovieService {

  static final dio = Dio(BaseOptions(
      headers: {
        'Authorization': Api.apiKey
      }
  ));

  static Future<List<Movie>> getMovie({required String apiPath, required int page}) async {
    try {
      final response = await dio.get(apiPath,
          queryParameters: {
       'page':page
      }
      );
      return (response.data['results'] as List).map((e) => Movie.formJson(e) ).toList();
    } on DioException catch (err) {
      throw '${err.message}';
    }
  }


  static Future<List<Video>> getVideo({required int id}) async {
    try {
      final response = await dio.get('${Api.baseUrl}/movie/$id/videos');
      print(response.data);
      return (response.data['results'] as List).map((e) => Video.fromJson(e) ).toList();
    } on DioException catch (err) {
      throw '${err.message}';
    }
  }

  static Future<List<Movie>> getSearch({required String searchText}) async {
    try {
      final response = await dio.get('${Api.getSearchMovie}', queryParameters: {
        'query': searchText
      });
      if((response.data['results'] as List).isEmpty){
        throw 'please provide another search keyword';
      }else{
        return (response.data['results'] as List).map((e) => Movie.formJson(e) ).toList();
      }

    } on DioException catch (err) {
      throw '${err.message}';
    }
  }



}


