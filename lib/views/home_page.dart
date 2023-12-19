import 'package:firstapp/common_widgets/error_widget.dart';
import 'package:firstapp/common_widgets/loading_widget.dart';
import 'package:firstapp/provider/meal_provider.dart';
import 'package:firstapp/views/item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';



class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(mealProvider);
    return  Scaffold(
      appBar: AppBar(),
      body: state.when(
          data: (data){
            return GridView.builder(
              itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3
                ),
                itemBuilder: (context, index){
                final cata = data[index];
                return InkWell(
                  onTap: (){
                    Get.to(()=> ItemPage(label: cata.strCategory),transition: Transition.leftToRight);
                  },
                  child: Column(
                    children: [
                      Text(cata.strCategory),
                      Image.network(cata.strCategoryThumb)
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
      )
    );
  }
}


