import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_it/Services/AppPallete.dart';

class SearchField extends StatefulWidget {
  final Function(String)? onTextChanged; 
  final Function(String)? onFocusLost;

  const SearchField({super.key, this.onTextChanged, this.onFocusLost});

  @override
  // ignore: library_private_types_in_public_api
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_debounce?.isActive ?? false) _debounce!.cancel();

      _debounce = Timer(const Duration(milliseconds: 300), () {
        if (widget.onTextChanged != null) {
          widget.onTextChanged!(_controller.text);
        }
      });
    });

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        if (widget.onFocusLost != null) {
          widget.onFocusLost!(_controller.text);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Pallete.softgrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Pallete.softgrey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
