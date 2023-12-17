

import 'package:firstapp/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final state = ref.watch(movieProvider);
    return  Tab(
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Popular',),
              Tab(text: 'TopRated',),
              Tab(text: 'UpComing',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text('data1'),
            Text('data2'),
            Text('data3'),
          ],
        ),
      ),
    );


  }
}
