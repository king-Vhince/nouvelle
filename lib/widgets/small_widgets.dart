import 'package:flutter/material.dart';

// For the signup option boxes in both Login and Signup page
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
