
import 'dart:async';
import 'package:firstapp/api_services/movie_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/movie.dart';


final searchProvider = AsyncNotifierProvider(() => SearchProvider());


class SearchProvider extends AsyncNotifier{

  @override
  Future<List<Movie>> build() async{
    return [];
  }


  Future<void> getSearchData(String searchText) async{
    state = const AsyncLoading();
    state  = await AsyncValue.guard(() => MovieService.getSearch(searchText: searchText));
  }


}