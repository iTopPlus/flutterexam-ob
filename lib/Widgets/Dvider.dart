import 'package:flutter/material.dart';
import 'package:project_it/Services/AppPallete.dart';

class AppDivider extends StatelessWidget {
  final String label;
  final double margin;
  const AppDivider({super.key, required this.label, this.margin = 20.0}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin), // Use the margin variable
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, color: Pallete.grey),
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
