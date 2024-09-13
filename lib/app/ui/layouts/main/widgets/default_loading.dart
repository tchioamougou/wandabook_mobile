import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class DefaultLoading extends StatelessWidget {
  const DefaultLoading({Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeInOut(
      color: Get.isDarkMode?Colors.yellow:Colors.black,
      size: 75,
    );
  }
}
