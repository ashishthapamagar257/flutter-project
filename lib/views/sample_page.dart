import 'dart:math';

import 'package:firstapp/provider/riverpod_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





class SamplePage extends ConsumerWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final nums = ref.watch(nPro);
    print(nums);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      body: Column(
          children: [
            TextButton(onPressed: (){
              final num = Random().nextInt(10) + 1;
              ref.read(nPro.notifier).noteAdd(num);
            },
                child: const Text('Add')),

            const Placeholder()],
      ),
    );
  }
}



