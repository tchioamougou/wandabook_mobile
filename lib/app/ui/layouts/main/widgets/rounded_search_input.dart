import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wandabook/app/ui/layouts/main/main_layout.dart';

class RoundedSearchInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const RoundedSearchInput({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.sp,right: 20.sp),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Get.isDarkMode? Colors.black: Colors.grey[200],
        border: Border.all(color: Colors.grey.withOpacity(0.2))
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration:  InputDecoration(
          fillColor: Get.isDarkMode
              ? Colors.black
              : Colors
              .white,
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
