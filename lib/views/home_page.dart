import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firstapp/constants/app_sizes.dart';
import 'package:firstapp/dummy/book_data.dart';
import 'package:firstapp/views/widgets/sample.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Hi John,'),
          actions: const [
            Icon(CupertinoIcons.search),
            AppSizes.gapW16,
            Icon(
              CupertinoIcons.bell_fill, color: Colors.red,size: 30,),
            AppSizes.gapW16
          ],
        ),
        body: ListView(
          children: [

            Image.asset('assets/images/mermaid.jpg',
              height: 300.h,
              width: double.infinity, fit: BoxFit.cover,),
            AppSizes.gapH14,
            const Sample(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('You may also like',
                    style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    height: 200.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: bookDataFromJson.length,
                        itemBuilder: (context, index){
                          return Container(
                            width: 100.w,
                            margin: EdgeInsets.only(right: 10.w),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10.w),
                                    child: Image.network(bookDataFromJson[index].image)),
                                AppSizes.gapH6,
                                Text(bookDataFromJson[index].genre, style: const TextStyle(color: Colors.blueGrey),),
                              ],
                            ),
                          );
                        }
                    ),
                  ),

                ],
              ),
            )

          ],
        )

    );
  }
}