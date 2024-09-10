import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int minQuantity;
  final int maxQuantity;
  final ValueChanged<int> onQuantityChanged;

   QuantitySelector({
    Key? key,
    this.minQuantity = 1,
    this.maxQuantity = 100,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () => _updateQuantity(-1),
        ),
        Text(
          '$_quantity',
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.add),
          onPressed: () => _updateQuantity(1),
        ),
      ],
    );
  }

  int get _quantity => _quantityController.value;
  set _quantity(int value) {
    onQuantityChanged(value);
  }
  final ValueNotifier<int> _quantityController = ValueNotifier<int>(1);

  void _updateQuantity(int delta) {
    final newQuantity = _quantity + delta;
    if (newQuantity >= minQuantity && newQuantity <= maxQuantity) {
      _quantity = newQuantity;
    }
  }
}
