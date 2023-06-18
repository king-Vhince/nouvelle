import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputForm extends StatelessWidget {
  Function(String)? onChanged;
  String? Function(String?)? validator;
  Widget? suffixIcon;
  String? hintText;
  bool obscureText;

  InputForm(
      {this.onChanged,
      this.validator,
      this.suffixIcon,
      this.hintText,
      required this.obscureText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 49.0),
      child: TextFormField(
        obscureText: obscureText,
        style: const TextStyle(
          color: Color.fromARGB(255, 31, 36, 41),
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          // contentPadding: const EdgeInsets.fromLTRB(13, 13, 13, 13),
          contentPadding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
          suffixIconConstraints: const BoxConstraints(
              // minHeight: 24,
              // minWidth: 24,
              ),
          isDense: true,
          // isCollapsed: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            // color: Color.fromARGB(255, 146, 144, 156),
            color: Color.fromARGB(255, 128, 126, 136),
            fontSize: 14,
          ),
          filled: true,
          fillColor: Color(0xFFE2DFF5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(0, 218, 216, 216),
              width: 0.65,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(0, 226, 223, 245),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
