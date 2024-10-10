import 'package:flutter/material.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Widgets/CusorPointer.dart';

class MyInput extends StatefulWidget {
  final String placeholder;
  final bool obscureText;
  final TextEditingController? inputController;
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final EdgeInsets? margin;
  final VoidCallback? onTabSuffix; // Fixed naming convention
  const MyInput({
    super.key,
    this.inputController,
    required this.placeholder,
    this.leadingIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.margin,
    this.onTabSuffix,
  });

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        controller: widget.inputController,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon != null
              ? GestureDetector(
                  onTap: widget.onTabSuffix,
                  child: CPointer(child: widget.suffixIcon!),
                )
              : null,
          hintText: widget.placeholder,
          hintStyle: TextStyle(color: Pallete.secondary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Pallete.secondary, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Pallete.secondary, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.blue, width: 1),
          ),
        ),
        obscureText: widget.obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password'; 
          }
          return null;
        },
      ),
    );
  }
}
