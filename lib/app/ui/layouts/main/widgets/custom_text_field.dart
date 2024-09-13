import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/ui/layouts/main/main_layout.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String label;
  final TextInputType type;
  final bool obscureText;
  final Rx<TextEditingController> controller;
  final bool required;
 final RxString errorText ="".obs;
   CustomTextField({Key? key,
    required this.icon,
    required this.hintText,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.type = TextInputType.text,
    this.required = false,
  }) : super(key: key);

  String _validate(String text) {
    if (type == TextInputType.emailAddress) {
      if (!isValidEmail(text) && text.isNotEmpty) {
        return "Invalid format email name@example.com";
      }
    } else if (!text.isNotEmpty && required) {
      return 'This field is required';
    }
    return '';
  }

  bool isValidEmail(String email) {
    // Replace with your desired email validation logic
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    controller.value.addListener((){
         errorText.value = _validate(controller.value.text);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 10.h),
        Obx(()=>TextFormField(
          controller: controller.value,
          obscureText: obscureText,
          keyboardType: type,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey)),
            prefixIcon: Icon(icon),
            hintText: hintText,
            filled: true,
            errorText: errorText.value.isNotEmpty?errorText.value:null,
            fillColor: Get.isDarkMode ? Colors.black45 : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )),
        SizedBox(height: 15.h),
      ],
    );
  }
}


