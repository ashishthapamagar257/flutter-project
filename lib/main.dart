import 'package:firstapp/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';



void main (){

  runApp(ProviderScope(child: Home()));

}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true
      ),
      home: HomePage(),
    );
  }
}



