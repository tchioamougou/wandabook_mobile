import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/controllers/bucket_controller.dart';
import 'package:wandabook/app/data/models/book_new_model.dart';
import 'package:wandabook/app/routes/app_routes.dart';
import 'package:wandabook/app/ui/layouts/main/main_layout.dart';

class BookItemHorizontal extends StatelessWidget {
  final Book book;

  const BookItemHorizontal({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  BucketController bucketController = Get.find<BucketController>();
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  book.volumeInfo!.imageLinks.smallThumbnail,
                  width: 80,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.volumeInfo!.title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      book.volumeInfo!.authors.join(', '),
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    /* Text(
                 '\$${book.price}',
                 style:  TextStyle(fontSize: 16.sp),
               ),*/
                    const SizedBox(height: 5),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: () {
                    bucketController.removeBookFromBucket(book);
                  },
                  color: Colors.orange,
                  icon: Icon(
                    Icons.delete_forever,
                    size: 20,
                  ))),
        ],
      ),
    );
  }
}
