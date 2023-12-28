
import 'package:firstapp/api_services/movie_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





final videoProvider = FutureProvider.family(
        (ref, int id) => MovieService.getVideo(id: id));

