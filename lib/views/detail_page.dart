import 'package:flutter/material.dart';
import 'package:firstapp/constants/app_sizes.dart';
import 'package:firstapp/model/book.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Image.network(
          book.image,
          height: 450.h,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        AppSizes.gapH16,
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(book.title),
                  Column(
                    children: [Text(book.genre), Text(book.rating)],
                  )
                ],
              ),
              AppSizes.gapH16,
              Text(book.detail),
              AppSizes.gapH16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          //backgroundColor: Colors.blue,
                          // foregroundColor: Colors.black
                          ),
                      onPressed: () {},
                      child: const Text('Read Book')),
                  AppSizes.gapW14,
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.pink),
                      onPressed: () {},
                      child: const Text('More Info'))
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
