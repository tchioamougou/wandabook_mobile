
import 'package:cinetpay/cinetpay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/controllers/subscription_controller.dart';
class CheckoutController extends GetxController {
  RxString paymentMethod = ''.obs;
  bool isLoading = false;
  bool disabled = true;
  bool initialisation = true;
  final formKey = GlobalKey<FormState>();
  final controllerCard = TextEditingController();
  SubscriptionController subscriptionController = Get.find<SubscriptionController>();
  String clientSecret = '';
  RxDouble totalAmount = 0.0.obs;
  @override
  void onInit() {
    // TODO: implement onInit,
    totalAmount.value = subscriptionController.selectedPlan.value.price;
    super.onInit();
  }
  Future<void> handleStripePayment() async {
    bool isError = false;
  }
  Future<void> handleCinetPayPayment() async {
        await Get.to(() => CinetPayCheckout(
          title: 'Griot',
          titleStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          titleBackgroundColor: Colors.deepPurple,
          configData: <String, dynamic>{
            'apikey': 'Constants.cinetApiKey',
            'site_id': 20,
            'notify_url': "Constants.cinetNotifyUrl"
          },
          paymentData: <String, dynamic>{
            'transaction_id': "UtilityFunction.generateTransactionID()",
            'amount': "200",
            'currency': 'XAF',
            'channels': 'ALL',
            'description':' chg.description'
          },
          waitResponse: (response) {
              isLoading = false;
          },
          onError: (error) {
              isLoading = false;
            Get.back();
          }));
  }
  Future<void> startPayment() async {
    if (paymentMethod.value == 'CreditCard') {
      if (formKey.currentState!.validate()) {
      } else {
        return;
      }
        isLoading = true;
      await handleStripePayment();
    } else if (paymentMethod.value == "mobileMoney") {
      await handleCinetPayPayment();
    }
  }
}