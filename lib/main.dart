import 'package:firstapp/views/home_page.dart';
import 'package:firstapp/views/sample_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firstapp/constants/colors.dart';
 import 'package:firstapp/provider/riverpod_providers.dart';

void main() {
  // final colors = ['red', 'blue'];
  // final newColors = [colors, 'purple', 'silver', 'gold'];
  runApp(const ProviderScope(child: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(width, height),
      builder: (c, d) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Raleway',
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.backGroundColors
            // backgroundColor: Colors.pink.shade400,
            // foregroundColor: Colors.black
          ),
          colorSchemeSeed: AppColors.mainColor,
          scaffoldBackgroundColor: AppColors.backGroundColors,
          // textTheme: TextTheme(
          //   titleMedium: TextStyle()
          // )
        ),
        // theme: ThemeData.dark().copyWith(
        //     useMaterial3: true,
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)
        // ),
        home: const SamplePage(),
        // home: Counter(),
      ),
    );
  }
}

// class Counter extends StatelessWidget {
//   const Counter({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     print('build');
//
//     return Scaffold(
//         body: Center(
//           child: Consumer(
//               builder: (context, ref, child) {
//                 final n = ref.watch(count);
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text('$n', style: TextStyle(fontSize: 30),),
//
//                     Text(n%2==0? 'even': 'odd', style: TextStyle(fontSize: 30),),
//                     TextButton(
//                         onPressed: () {
//                           ref.read(count.notifier).state++;
//                         }, child: Text('Add')),
//
//
//                     TextButton(
//                         onPressed: () {
//                          ref.read(count.notifier).state--;
//                         }, child: Text('Less')),
//
//
//                   ],
//                 );
//               }
//           ),
//         )
//     );
//   }
// }
