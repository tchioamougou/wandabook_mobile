import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/routes/app_routes.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() => SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                          itemCount: demo_data.length,
                          controller: controller.pageController,
                          onPageChanged: (index) {
                            controller.pageIndex.value = index;
                          },
                          itemBuilder: (context, index) => OnBoardingContent(
                                image: demo_data[index].image,
                                title: demo_data[index].title,
                                description: demo_data[index].description,
                              ))),
                  Row(
                    children: [
                      ...List.generate(
                          demo_data.length,
                          (index) => DotIndicator(
                                isActive: index == controller.pageIndex.value,
                              )),
                      const Spacer(),
                      SizedBox(
                        height: 70.h,
                        width: 70.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if(controller.pageIndex.value == demo_data.length -1){
                                  Get.offAllNamed(AppRoutes. HOME);
                                }else{
                                  controller.pageController.nextPage(
                                      duration: Duration(microseconds: 300),
                                      curve: Curves.ease);
                                }

                              },
                              style:
                              ElevatedButton.styleFrom(shape: CircleBorder(), backgroundColor: Colors.blue),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ))),
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  final String image, title, description;

  const OnBoardingContent(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 200,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(description, textAlign: TextAlign.center,),
        const Spacer(),
      ],
    );
  }
}

class OnBoard {
  final String image, title, description;
  OnBoard(
      {required this.image, required this.title, required this.description});
}

final List<OnBoard> demo_data = [
  OnBoard(
      image: 'assets/image/person_reading.jpg',
      title: 'Discover Your Next Great Read',
      description: 'Explore a world of books and find your perfect match.'),
  OnBoard(
      image: 'assets/image/simple_interface.jpg',
      title: 'Effortless Browsing and Borrowing',
      description: 'Find books, reserve them, and pick them up with ease.'),
  OnBoard(
      image: 'assets/image/bookcollection.jpg',
      title: 'A Vast Collection Awaits',
      description:
          ' From classics to contemporary bestsellers, we have something for everyone.'),
];

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive ? Colors.red : Colors.red.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
