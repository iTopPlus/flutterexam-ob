import 'package:flutter/material.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/HexColor.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color bgColor;
  final EdgeInsets? margin;
  final VoidCallback obTap;
  const AppButton({
    super.key,
    required this.label,
    required this.obTap,
    this.margin,
    this.textColor = Colors.white,
    this.bgColor = const Color.fromARGB(255, 89, 186, 173),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: obTap,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
