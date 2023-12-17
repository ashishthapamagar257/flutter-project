



import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_services/food_services.dart';

final categoryProvider = FutureProvider((ref) => FoodService.getCategory());
final categoryItemProvider = FutureProvider.family(
        (ref, String category) => FoodService.getFoodItem(category: category));