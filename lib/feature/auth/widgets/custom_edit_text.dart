import 'package:flutter/material.dart';

class CustomEditText extends StatefulWidget {
  final String labelText;
  // final IconData prefixIcon;
  final TextEditingController controller;

  const CustomEditText({
    super.key,
    required this.labelText,
    // required this.prefixIcon,
    required this.controller,
  });

  @override
  State<CustomEditText> createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 250,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: Theme.of(context).textTheme.labelMedium,
          // prefixIcon: Icon(widget.prefixIcon),
        ),
      ),
    );
  }
}
