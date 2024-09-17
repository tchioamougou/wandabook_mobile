import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/ui/layouts/main/widgets/book_item.dart';
import 'package:wandabook/app/ui/layouts/main/widgets/rounded_search_input.dart';
import 'package:wandabook/app/ui/utils/constants.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/search_controller.dart';
import '../../layouts/main/widgets/custom_category_select.dart';

class SearchPage extends GetView<SearchPageController> {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
            child: Obx(() => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.75.sp,
                          child: RoundedSearchInput(
                              controller: controller.searchController,
                              onChanged: (val) {
                                if (val.isNotEmpty) {
                                  controller.findBooks();
                                }
                              }),
                        ),

                        CustomCategorySelect(
                            label:const Icon(Icons.filter_list),
                            options: controller.bookCategories,
                            selectedCat: controller.selectCat.value,
                            onChanged: (cate) {
                              controller.selectCategory(cate);
                            })

                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Card(
                      color: Constants.defaultRed,
                      child:Container(
                        padding: EdgeInsets.all(10.h),
                        child:  Text(controller.selectCat.value, style: const TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    if (controller.isLoading.value)
                       SpinKitCircle(
                        color: Constants.defaultRed,
                        size: 40,
                      )
                    else
                      Expanded(
                          child: GridView.count(
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        childAspectRatio: 0.65,
                        children: controller.books
                            .map((item) => BookItem(book: item))
                            .toList(),
                      )),
                  ],
                ))),
      ),
    );
  }
}
