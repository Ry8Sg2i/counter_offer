import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  const TextFieldWidget({
    super.key,
      required this.textEditingController,
        required this.labelText,
  });
  final TextEditingController textEditingController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}