import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/ui/layouts/main/widgets/book_item_horizontal.dart';
import 'package:wandabook/app/ui/layouts/main/widgets/custom_buttom.dart';
import 'package:wandabook/app/ui/utils/constants.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/bucket_controller.dart';

class BucketPage extends GetView<BucketController> {
  const BucketPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Obx(()=>Stack(
        children: [
          Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              title: const Text('My cart'),
              centerTitle: true,
              elevation: 0,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                      child:Column(
                        children: [
                          Column(
                            children: controller.selectBooks
                                .map(
                                  (item) => BookItemHorizontal(book: item),
                            )
                                .toList(),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:CustomButton(
              onPressed: () {},
              titleText: 'Borrowed Now',
              buttonColor: Constants.defaultRed,
            ),
          ),
        ],
      )),
    );
  }
}
