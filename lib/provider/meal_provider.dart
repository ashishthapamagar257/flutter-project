


import 'package:firstapp/service/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





final mealProvider = FutureProvider((ref) => ApiService.getData());
final itemProvider = FutureProvider.family((ref, String meal) =>
    ApiService.mealItem(meal: meal));
final recipeProvider = FutureProvider.family(
        (ref, String id) => ApiService.getRecipe(id: id));


