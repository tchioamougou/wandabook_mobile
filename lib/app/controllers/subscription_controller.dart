
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/data/models/subscription_plan_model.dart';
import 'package:wandabook/app/routes/app_routes.dart';
class SubscriptionController extends GetxController {
  RxList<SubscriptionPlanModel> subscriptionPlans = <SubscriptionPlanModel>[]
      .obs;
  Rx<SubscriptionPlanModel> selectedPlan = SubscriptionPlanModel(currency: '',allowedBooks: 0,description: '',maxBooks: 0,planId: '',price: 0).obs;
  void fetchSubscriptionsPlan() async {
    final jsonString = await rootBundle.loadString('assets/subscription_plan.json');
    if (jsonString.isNotEmpty) {
      final data = jsonDecode(jsonString);
      List<SubscriptionPlanModel> listA = (data as List)
          .map((e) => SubscriptionPlanModel.fromJson(e))
          .toList();
      subscriptionPlans.value = listA;
    }
  }
  @override
  void onInit() async {
    // TODO: implement onInit
    fetchSubscriptionsPlan();

    super.onInit();
  }

  void selectPlan(SubscriptionPlanModel act) {
    selectedPlan.value = act;
  }
  void next(){
    if(selectedPlan.value.currency.isNotEmpty && !selectedPlan.value.price.isEqual(0)){
      Get.toNamed(AppRoutes.CHECKOUT);
    }
  }
}