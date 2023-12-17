import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final Movie movie;
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(VideoProvider(movie.id));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            state.when(
              
            )
          ],
        ),
      ),
    );
  }
}
