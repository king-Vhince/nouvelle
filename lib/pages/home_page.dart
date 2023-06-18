import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nouvelle/contact_page.dart';

import '../auth/login_page.dart';
import '../service/auth_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF762672),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome to the home page"),
            Row(
              children: [
                const Text("go to the"),
                GestureDetector(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactPage()));
                  }),
                  child: const Text(
                    " Contact page",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // backgroundColor: themeNotifier.isDark
                        //     ? Color.fromARGB(255, 39, 19, 39)
                        //     : Colors.white,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        title: const Text("Log out"),
                        content:
                            const Text("Are you sure you want to Log out?"),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 212, 195, 214),
                                ),
                              ),
                              child: const Icon(
                                Icons.cancel,
                                color: Color(0xFFF337D5),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              authService.signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                  (route) => false);
                            },
                            icon: const Icon(
                              Icons.done,
                              color: Color.fromARGB(255, 22, 131, 125),
                            ),
                          )
                        ],
                      );
                    },
                  );
                  // authService.signOut();
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: (context) => const LoginPage()),
                  //     (route) => false);
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.pink,
                ))
          ],
        ),
      ),
    );
  }
}
