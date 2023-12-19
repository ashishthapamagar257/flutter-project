


import 'package:firstapp/service/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealProvider = FutureProvider((ref) => ApiServices.getData());
final itemProvider = FutureProvider.family((ref, String meal) => ApiServices.mealItem(meal: meal));
final recipeProvider = FutureProvider.family((ref, String id) => ApiServices.getRecipe(id: id));
