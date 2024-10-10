import 'package:flutter/material.dart';

class MyCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color borderColor;
  final Color checkedColor;

  const MyCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.borderColor = Colors.grey,
    this.checkedColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(color: value ? checkedColor : borderColor, width: 2),
          borderRadius: BorderRadius.circular(4),
          color: value ? checkedColor : Colors.transparent,
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 20,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
