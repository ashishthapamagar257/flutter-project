import 'package:firstapp/constants/api.dart';
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