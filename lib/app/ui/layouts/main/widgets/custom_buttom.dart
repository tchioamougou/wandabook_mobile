import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final VoidCallback onPressed;
  final String titleText;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? titleColor;
  final double? border;

  CustomButton(
      {required this.buttonColor,
        required this.onPressed,
        required this.titleText,
        this.width,
        this.fontSize,
        this.titleColor,
        this.border,
        this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height ?? 50,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.orange.withOpacity(0.3199999928474426),
            ),
            borderRadius: BorderRadius.circular(border ?? 30.0),
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.transparent,
            backgroundColor: buttonColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleText,
                style: TextStyle(
                  color: titleColor ?? Theme.of(context).colorScheme.onPrimary,
                  fontSize: fontSize ?? 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}