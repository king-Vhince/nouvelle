import 'package:flutter/material.dart';

showTextFormField(
  String title,
  IconData icon,
  String hint,
  bool isPassword,
  // Widget? iconWidget,
  String? Function(String?)? validation,
  String? Function(String?)? onChanged,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 49.0),
    child: TextFormField(
      // keyboardType: TextInputType.emailAddress,
      textAlignVertical: TextAlignVertical.center,
      obscureText: isPassword,
      onChanged: onChanged,
      validator: validation,
      decoration: InputDecoration(
        hintText: hint,
        // suffixIcon: iconWidget,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 6),
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 155, 192, 223),
            size: 21,
          ),
        ),
        isCollapsed: true,
        contentPadding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
        fillColor: const Color(0xFFE2DFF5),
        filled: true,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 146, 144, 156),
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
            // color: const Color.fromARGB(255, 218, 216, 216),
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 218, 216, 216),
              width: 0.65,
            ),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFE2DFF5),
            ),
            borderRadius: BorderRadius.circular(8)),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    ),
  );
}

final signUpOptionsBoxDec = BoxDecoration(
  border: Border.all(
    color: const Color.fromARGB(255, 218, 216, 216),
  ),
  color: const Color(0xFFE2DFF5),
  gradient: const RadialGradient(
    colors: [
      Color.fromARGB(255, 250, 248, 248),
      Color(0xFFE2DFF5),
    ],
  ),
  borderRadius: BorderRadius.circular(10),
);

nextScreen(context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

nextScreenReplacement(context, page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
    // duration: const Duration(seconds: 4),
    action: SnackBarAction(
      label: "ok",
      onPressed: (() {}),
      textColor: Colors.white,
    ),
  ));
}

final textInputDecoration = InputDecoration(
  // isCollapsed: true,
  isDense: true,
  contentPadding: const EdgeInsets.fromLTRB(12, 13, 13, 13),
  fillColor: const Color(0xFFE2DFF5),
  filled: true,
  hintStyle: const TextStyle(
    color: Color.fromARGB(255, 146, 144, 156),
    fontSize: 14,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      width: 0,
      style: BorderStyle.none,
      // color: const Color.fromARGB(255, 218, 216, 216),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(255, 218, 216, 216),
      width: 0.65,
    ),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0xFFE2DFF5),
    ),
    borderRadius: BorderRadius.circular(8),
  ),
  // errorBorder: const OutlineInputBorder(
  //   borderSide: BorderSide(color: Colors.red),
  // ),
);
