
import 'package:firstapp/api_services/movie_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final movieProvider = FutureProvider.family(
        (ref, String apiPath) => MovieService.getMovie(apiPath: apiPath));

final videoProvider = FutureProvider.family(
        (ref, int id) => MovieService.getVideo(id: id));

