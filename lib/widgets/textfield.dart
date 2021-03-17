import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatelessWidget {
  final Function() onTap;
  final TextStyle style;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final Function(String) validator;
  final Function(String) onChanged;
  final int maxLines;
  final int maxLength;
  final List<TextInputFormatter> inputFormatters;
  final AutovalidateMode autovalidateMode;
  final bool obscureText;
  final String label;
  final String hint;
  final InputDecoration decoration;
  final Widget icon;
  final EdgeInsets padding;

  TextFieldCustom(
      {this.controller,
      this.textAlign = TextAlign.start,
      this.onTap,
      this.keyboardType,
      this.style,
      this.autovalidateMode,
      this.maxLength,
      this.maxLines = 1,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      this.obscureText = false,
      this.hint,
      this.label,
      this.decoration,
      this.icon,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        onTap: onTap,
        style: style,
        controller: controller,
        keyboardType: keyboardType,
        textAlign: textAlign,
        validator: validator,
        decoration: decoration ??
            InputDecoration(
              labelText: label,
              hintText: hint,
              icon: icon,
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorderFocus,
            ),
        onChanged: onChanged,
        maxLines: maxLines,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        autovalidateMode: autovalidateMode,
        obscureText: obscureText,
      ),
    );
  }
}

OutlineInputBorder get outlineInputBorder {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      width: 0.5,
      color: Colors.grey,
    ),
  );
}

OutlineInputBorder get outlineInputBorderFocus {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      width: 0.5,
      color: Colors.blue,
    ),
  );
}
