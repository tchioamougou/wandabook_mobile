import 'package:flutter/material.dart';
import 'package:wandabook/app/ui/layouts/main/main_layout.dart';

class CarouselContent extends StatelessWidget {
  final Color color;
  final double radius;
  final Widget child;

  const CarouselContent({
    required this.color,
    required this.radius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25,
      left: 0,
      right: 0,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250.w,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Adjust padding as needed
                child: Center(
                  child: child,
                ),
              ),
            )
          ],
        ),
      )
      ,

    );
  }
}