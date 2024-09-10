import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/controllers/book_detail_controller.dart';
import 'package:wandabook/app/controllers/bucket_controller.dart';
import 'package:wandabook/app/data/models/book_new_model.dart';
import 'package:wandabook/app/routes/app_routes.dart';
import 'package:wandabook/app/ui/layouts/main/main_layout.dart';

class BookItem extends StatefulWidget {
  final Book book;

  const BookItem({Key? key, required this.book}) : super(key: key);

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  @override
  Widget build(BuildContext context) {
    final  BookDetailController bookDetailController =  Get.find<BookDetailController>();
    final  BucketController bucketController = Get.find<BucketController>();
    final  inCart = bucketController.checkCart(widget.book);
    return GestureDetector(
      onTap: (){
        bookDetailController.book = widget.book;
          Get.toNamed(AppRoutes.BOOK_DETAIL);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.book.volumeInfo!.imageLinks.smallThumbnail,
              width: 150,
              height: 150.h,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Container(
              width: 150.w,
              child: Text(
                widget.book.volumeInfo!.title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: 150.w,
              child: Text(
                widget.book.volumeInfo!.authors.join(', '),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 1,
                style: TextStyle(fontSize: 13.sp, color: Colors.grey),
              ),
            ),
        Container(
          width: 150.w,
          padding: EdgeInsets.only(right: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if(inCart)
                IconButton(
                  onPressed: (){
                    bucketController.removeBookFromBucket(widget.book);
                    setState(() {

                    });
                  }, icon: Icon(Icons.check_circle_outline,size: 20, color: Colors.green,),
                  padding: EdgeInsets.zero,
                )
              else
                IconButton(onPressed: (){
                  bucketController.addBookToBucket(widget.book);
                  setState(() {

                  });
                }, icon: Icon(Icons.add_circle_outline,size: 20, color: Colors.orange,))
            ],
          ),
        ),

            const SizedBox(height: 5),
          /*  Text(
              '\$${book.price}',
              style:  TextStyle(fontSize: 16.sp),
            ),*/
            const SizedBox(height: 5),
            /*  Row(
            children: [
              Text(
                'Rice: ${book.rice}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 5),
              Text(
                'Picked: ${book.picked ? 'Yes' : 'No'}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          )*/
          ],
        ),
      ),
    );
  }
}
