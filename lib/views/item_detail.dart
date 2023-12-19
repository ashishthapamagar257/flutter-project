import 'package:firstapp/common_widgets/error_widget.dart';
import 'package:firstapp/common_widgets/loading_widget.dart';
import 'package:firstapp/provider/meal_provider.dart';
import 'package:firstapp/views/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemDetail extends ConsumerWidget {
final String id;
  const ItemDetail({super.key,required this.id});

  @override
  Widget build(BuildContext context,ref) {
    final state = ref.watch(recipeProvider(id));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.all(10.0),
          child: state.when(
              data: (data){

                final list = data.strYoutube.split('=');
                return Column(
                  children: [
                    PlayVideoFromNetwork(idKey: list[1]),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Image.network(data.strMealThumb,height: 200,),
                          const SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.strMeal),
                          Text(data.strArea),
                        ],
                      ),
                ],
                      ),
                    ),

                    Expanded(child: SingleChildScrollView(child: Text(data.strInstructions))),
                  ],
                );
              },
              error: (err,st){
                return ErrorUi(message: '$err');
              },
              loading: () => const LoadingWidget()
          ),
        ),
      ),
    );
  }
}
