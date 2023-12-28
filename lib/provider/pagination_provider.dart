


import 'package:firstapp/api_services/movie_services.dart';
import 'package:firstapp/model/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';




class MoviePageNotifier extends PagedNotifier<int, Movie> {

  final String apiPath;
  MoviePageNotifier({
    required this.apiPath
  }):
        super(
        load: (page, limit) => MovieService.getMovie(
            apiPath: apiPath,
          page: page
        ),
        nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
      );

}


final  pageProvider =
StateNotifierProvider.family<MoviePageNotifier,
    PagedState<int, Movie>, String>((_, String apiPath) => MoviePageNotifier(apiPath: apiPath));