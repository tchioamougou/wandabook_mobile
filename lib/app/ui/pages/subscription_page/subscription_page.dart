import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/routes/app_routes.dart';
import 'package:wandabook/app/ui/layouts/main/widgets/custom_buttom.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/subscription_controller.dart';

class SubscriptionPage extends GetView<SubscriptionController> {
  const SubscriptionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Stack(
        children: [
          Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body: Stack(
                children: [
                  SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
                        child: Column(
                          children: [
                            SizedBox(height: 20.w,),
                            Text(
                              'Select your plan for borrowing books each month',
                              style: TextStyle(
                                  fontSize: 29.sp, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20.w,),
                            Obx(
                                  () => Column(
                                children: controller.subscriptionPlans.map((account) {
                                  return SizedBox(
                                      width: double.infinity,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.selectPlan(account);
                                        },
                                        child: Card(
                                          elevation: 20,
                                          color: Colors.white,
                                          shape:
                                          (controller.selectedPlan.value.planId ==
                                              account.planId)
                                              ? Border.all(color: Colors.orange,width: 2)
                                              : null,
                                          shadowColor: Colors.orange,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w, vertical: 10.h),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      account.planId.tr,
                                                      style: TextStyle(
                                                          fontSize: 25.sp,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    if (controller.selectedPlan.value
                                                        .planId ==
                                                        account.planId)
                                                      const Icon(
                                                        Icons.check_circle,
                                                        color: Colors.orange,
                                                      )
                                                  ],
                                                ),
                                                Text(
                                                  '${account.price} ${account.currency} / Month'
                                                      .tr,
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  account.description.tr,
                                                  style: TextStyle(fontSize: 13.sp),
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                }).toList(),
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              )),
          Positioned(
              bottom: 0,
              child: Card(
                color: Colors.white,
                elevation: 0,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: CustomButton(
                        buttonColor: Colors.orange,
                        titleText: "Continue".tr,
                        titleColor: Colors.white,
                        onPressed: () {
                          Get.toNamed(AppRoutes.CHECKOUT);
                        },
                      ),
                    ),
                    Text('Learn more about our subscriptions')
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
