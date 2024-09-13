import 'package:flutter/material.dart';
import 'package:wandabook/app/ui/layouts/main/main_layout.dart';

class QuantitySelector extends StatefulWidget {
  final int minQuantity;
  final int maxQuantity;
  final ValueChanged<int> onQuantityChanged;

  const QuantitySelector({Key? key,
    this.minQuantity = 1,
    this.maxQuantity = 100,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          child: Icon(Icons.remove,size: 17.sp,),
          onTap: () {
            _updateQuantity(-1);
            setState(() {

            });
          },
        ),
        SizedBox(width: 10.w,),
        Text(
          '$_quantity',
        ),
        SizedBox(width: 10.w,),
        GestureDetector(
          child: Icon(Icons.add,size: 17.sp,),
          onTap:  () {
            _updateQuantity(1);
            setState(() {

            });
          },
        ),
      ],
    );
  }

  int get _quantity => _quantityController.value;

  set _quantity(int value) {
    widget.onQuantityChanged(value);
  }

  final ValueNotifier<int> _quantityController = ValueNotifier<int>(1);

  void _updateQuantity(int delta) {
    final newQuantity = _quantity + delta;
    if (newQuantity >= widget.minQuantity &&
        newQuantity <= widget.maxQuantity) {
      _quantityController.value=newQuantity;
      _quantity = newQuantity;
    }
  }
}
