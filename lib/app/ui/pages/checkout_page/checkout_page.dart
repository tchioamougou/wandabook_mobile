import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/ui/layouts/main/widgets/custom_buttom.dart';
import 'package:wandabook/app/ui/layouts/main/widgets/quantity_selector.dart';
import 'package:wandabook/app/ui/layouts/main/widgets/rounded_container.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/checkout_controller.dart';

class CheckoutPage extends GetView<CheckoutController> {
      const CheckoutPage ({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const TextStyle boldText = TextStyle(
      fontWeight: FontWeight.bold,
    );
    return  MainLayout(
        child:  Stack(
          children: [
            Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
              ),
              body: Obx(()=>SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Check out",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RoundedContainer(
                            color: Colors.orange,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 8.0,
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "${controller.subscriptionController.selectedPlan.value.currency} ${controller.subscriptionController.selectedPlan.value.price}",
                                  style: boldText.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                const Text(
                                  "Per month",
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: RoundedContainer(
                              margin: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 8.0,
                              ),
                              child:Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:  <Widget>[
                                      QuantitySelector(onQuantityChanged: (int val){
                                        controller.totalAmount.value = val.toDouble()*controller.subscriptionController.selectedPlan.value.price;
                                      }),
                                      Text(
                                        "${controller.totalAmount}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 7.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:  <Widget>[
                                      Text(
                                        "Number of month".tr,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        "Total".tr,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                    RoundedContainer(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: (){
                          controller.paymentMethod.value="CreditCard";
                        },
                        leading: Icon(
                          FontAwesomeIcons.creditCard,
                          size: 25.sp,
                          color:controller.paymentMethod.value=="CreditCard"? Colors.orange:Colors.indigo,
                        ),
                        title: Text("Credit Card",style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('You will be redirected to a secure Credit Card page to make a payment.'),
                        trailing:controller.paymentMethod.value=="CreditCard"?Icon(Icons.check_circle,color: Colors.orange): null,
                      ),
                    ),
                    RoundedContainer(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: (){
                          controller.paymentMethod.value="mobileMoney";
                        },
                        leading: Icon(
                          FontAwesomeIcons.mobile,
                          size: 25.sp,
                          color:controller.paymentMethod.value=="mobileMoney"? Colors.orange:Colors.indigo,
                        ),
                        title: const Text("Mobile Money",style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text('You will be redirected to a secure CinetPay page to make a payment.'),

                        trailing:controller.paymentMethod.value=="mobileMoney"?Icon(Icons.check_circle,color: Colors.orange,): null,
                      ),
                    ),
                  ],
                ),
              )),
            ),
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
                          titleText: "Pay Now".tr,
                          titleColor: Colors.white,
                          onPressed: () {
                            controller.startPayment();
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        )
      );
  }
}

class CinetPayRedirect extends StatelessWidget {
  const CinetPayRedirect();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 200, // set your desired width
            height: 200, // and height
            child: Image.network(
                'https://docs.cinetpay.com/images/latest_box.webp'), // replace with your asset path
            // replace with your asset path
          ),
          const SizedBox(height: 0),
          const Text(
            'You will be redirected to a secure CinetPay page to make a payment.',
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}