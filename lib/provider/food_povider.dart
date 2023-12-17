



import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_services/movie_services.dart';

final categoryProvider = FutureProvider((ref) => FoodService.getCategory());
final categoryItemProvider = FutureProvider.family(
        (ref, String category) => FoodService.getFoodItem(category: category));