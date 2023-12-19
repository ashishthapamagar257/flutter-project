import 'package:firstapp/common_widgets/error_widget.dart';
import 'package:firstapp/common_widgets/loading_widget.dart';
import 'package:firstapp/provider/meal_provider.dart';
import 'package:firstapp/views/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class ItemPage extends ConsumerWidget{
  final String label;
  const ItemPage({super.key,required this.label});

  @override
  Widget build(BuildContext context,ref) {
    final state = ref.watch(itemProvider(label));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: state.when(
              data: (data){
                return GridView.builder(
                    itemCount: data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      mainAxisExtent: 200,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10

                    ),
                    itemBuilder: (context, index){
                      final item = data[index];
                      return InkWell(
                        onTap: (){
                          Get.to(() => ItemDetail(id: item.idMeal),transition: Transition.leftToRight);

                        },
                        child: Column(
                          children: [
                            Text(item.strMeal),
                            Image.network(item.strMealThumb)
                          ],
                        ),
                      );
                    }
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

