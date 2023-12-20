import 'package:firstapp/provider/movie_provider.dart';
import 'package:firstapp/views/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';



class TabBarWidgets extends ConsumerWidget {
  final String api;
  const TabBarWidgets({super.key, required this.api});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(movieProvider(api));
    return state.when(
        data: (data){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              key: PageStorageKey(api),
              itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 2/3
                ),
                itemBuilder: (context,index){
                final movie = data[index];
                return InkWell(
                    onTap: (){
                      Get.to(() => DetailPage(movie: movie));
                    },
                    child: Image.network(movie.poster_path));
                }
            ),
          );
        },
        error: (err,st) => Center(child: Text('$err')),
        loading: () => Center(child: CircularProgressIndicator())
    );
  }
}
