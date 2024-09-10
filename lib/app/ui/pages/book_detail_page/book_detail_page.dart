import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/book_detail_controller.dart';

class BookDetailPage extends GetView<BookDetailController> {
  const BookDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title:  Text(controller.book.volumeInfo!.title),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.share))
              ],
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.chevron_left),
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(top: 20.sp),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            controller.book.volumeInfo!.imageLinks.smallThumbnail,
                            width: 150,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            controller.book.volumeInfo!.title,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            controller.book.volumeInfo!.authors.join(', '),
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    elevation: 8,
                    shadowColor: Colors.orange,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Available',
                                style: TextStyle(color: Colors.orange),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Yes',
                              )
                            ],
                          ),
                         /* Column(
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(color: Colors.orange),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                             /* Text(
                                '${controller.book.price} XAF',
                              )*/
                            ],
                          ),*/
                          Column(
                            children: [
                              Text(
                                'For Salle',
                                style: TextStyle(color: Colors.orange),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'No',
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Number of page',
                                style: TextStyle(color: Colors.orange),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${controller.book.volumeInfo!.pageCount}',
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Synopsis',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(controller.book.volumeInfo!.description)
                      ],
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.small(
              backgroundColor: Colors.orange,
                onPressed: () {
                  if(controller.isInit){
                    controller.addBook(controller.book);
                  }
                }, child: const Icon(Icons.add_circle_outline,color: Colors.white,))));
  }
}
