import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/ui/layouts/main/widgets/book_item.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/init_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class InitPage extends GetView<InitController> {
      const InitPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
        child: Obx(()=>Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h,),
                CarouselSlider(
                    items: controller.headerItems
                        .map((item) => Container(
                      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200.w,
                            padding: EdgeInsets.only(left: 10.w),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('The Psychology of Money', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                Text('Morgan Housel', style: TextStyle(color: Colors.grey,),),
                                Text('Read More',style: TextStyle(color: Colors.orange),)
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                              },
                              child: ClipRRect(
                                child: Image.network(
                                  'https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg',
                                  fit: BoxFit.fill,
                                  width: 100.w,
                                  height: 125.h,
                                ),
                              )),
                          SizedBox(width: 10.h,),

                        ],
                      ),
                    ))
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.5,
                      enlargeCenterPage: true,
                    )),
                SizedBox(height: 20.h,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.bookCategories
                        .map((item) => TextButton(
                      child: Text(item,style: TextStyle(color: controller.selectCat.value==item? Colors.orange:(Get.isDarkMode? Colors.white: Colors.deepPurple)),),
                      onPressed: (){
                        controller.selectCategory(item);
                      },
                    ))
                        .toList(),
                  ),
                ),
                if(!controller.isLoading.value)
                  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.books
                        .map((item) => BookItem(book: item))
                        .toList(),
                  ),
                )
                else SpinKitCircle(
                  color: Colors.orange,
                  size: 40,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20.h), child:Text('Book on sale',style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),) ,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.books
                        .map((item) => BookItem(book: item))
                        .toList(),
                  ),
                ),

              ],
            ),
          ),
        )),
      );
  }
}
