import 'package:flutter/material.dart';

showDrawerHeaderInitials(String userName, String email) {
  return Padding(
    padding: const EdgeInsets.only(left: 9.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // user Name
        Text(
          userName,
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 5),
        // email
        Text(
          email,
          style: const TextStyle(
            color: Color.fromARGB(255, 219, 217, 217),
          ),
        ),
        const SizedBox(height: 14),
        // fans count
        showFansAndStansCount()
      ],
    ),
  );
}

showFansAndStansCount() {
  return Row(
    children: const [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "954 ",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            TextSpan(
              text: "fans",
              style: TextStyle(
                color: Color(0xFFE2E2E2),
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
      SizedBox(width: 12),
      Text.rich(TextSpan(children: [
        TextSpan(
          text: "600 ",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        TextSpan(
          text: "stans",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFFE2E2E2),
          ),
        )
      ])),
    ],
  );
}

showListTile(bool isSelected, Icon icon, Text text, VoidCallback onTap) {
  return ListTile(
    onTap: onTap,
    // contentPadding:
    //     const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    selected: isSelected,
    selectedColor: isSelected ? Colors.purple : const Color(0xFF9F919F),
    leading: icon,
    title: text,
  );
}
