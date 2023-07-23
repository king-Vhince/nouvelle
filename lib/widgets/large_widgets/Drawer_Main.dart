import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

import '../../../widgets/small_widgets.dart';
import '../../auth/login_page.dart';
import '../Drawer_small.dart';

class MyDrawer extends StatelessWidget {
  final headerWidth;
  final headerHeight;
  const MyDrawer(this.headerHeight, this.headerWidth);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // padding: const EdgeInsets.symmetric(vertical: 50),
        children: [
          SizedBox(
            width: headerWidth,
            height: headerHeight * 0.3,
            child: DrawerHeader(
                // padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  // color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFA909A1),
                      Color.fromARGB(209, 29, 134, 182),
                    ],
                    begin: Alignment.topLeft,
                  ),
                ),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(0),
                            child: const Icon(
                              Icons.account_circle,
                              size: 68,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 160,
                          ),
                          // IconButton(
                          //   onPressed: () {
                          //     themeNotifier.isDark
                          //         ? themeNotifier.isDark = false
                          //         : themeNotifier.isDark = true;
                          //   },
                          //   icon: themeNotifier.isDark
                          //       ? const Icon(Icons.wb_sunny)
                          //       : const Icon(
                          //           Iconsax.moon5,
                          //           color: Color.fromARGB(255, 14, 12, 51),
                          //         ),
                          // )
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Username, Email, fans_count...
                      // showDrawerHeaderInitials(userName, email)
                    ])),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {
                      // nextScreen(context, ProfilePage());
                    },
                    // contentPadding:
                    //     const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    selected: false,
                    selectedColor: Theme.of(context).primaryColor,
                    leading: const Icon(
                      IconlyLight.profile,
                      color: Color(0xFF9F919F),
                    ),
                    title: const Text(
                      "Profile",
                      // style: TextStyle(
                      //   color: Color(
                      //     0xFF3D283C,
                      //   ),
                      // ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      // popUp;
                    },
                    // contentPadding:
                    //     const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    selected: false,
                    selectedColor: Theme.of(context).primaryColor,
                    leading: const Icon(
                      Iconsax.people,
                      color: Color(0xFF9F919F),
                    ),
                    title: const Text(
                      "New group",
                      // style: TextStyle(
                      //   color: Color(
                      //     0xFF3D283C,
                      //   ),
                      // ),
                    ),
                  ),
                  showListTile(
                      false, const Icon(Icons.home), const Text("home"), () {}),
                  ListTile(
                    onTap: () {},
                    // contentPadding:
                    //     const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    selected: false,
                    selectedColor: Theme.of(context).primaryColor,
                    leading: const Icon(
                      Iconsax.bitcoin_refresh,
                      color: Color(0xFF9F919F),
                    ),
                    title: const Text(
                      "Crypto community",
                      // style: TextStyle(
                      //   color: Color(
                      //     0xFF3D283C,
                      //   ),
                      // ),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    // contentPadding:
                    //     const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    selected: false,
                    selectedColor: Theme.of(context).primaryColor,
                    leading: const Icon(
                      Iconsax.save_2,
                      color: Color(0xFF9F919F),
                    ),
                    title: const Text(
                      "Saved items",
                      // style: TextStyle(
                      //   color: Color(
                      //     0xFF3D283C,
                      //   ),
                      // ),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    // contentPadding:
                    //     const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    selected: false,
                    selectedColor: Theme.of(context).primaryColor,
                    leading: const Icon(
                      Iconsax.call,
                      color: Color(0xFF9F919F),
                    ),
                    title: const Text(
                      "Calls",
                      // style: TextStyle(
                      //   color: Color(
                      //     0xFF3D283C,
                      //   ),
                      // ),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    // contentPadding:
                    //     const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    selected: false,
                    selectedColor: Theme.of(context).primaryColor,
                    leading: const Icon(
                      Iconsax.profile_add,
                      color: Color(0xFF9F919F),
                    ),
                    title: const Text(
                      "Invite friends",
                      style: TextStyle(
                          // color: Color(
                          //   0xFF3D283C,
                          // ),
                          ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.35,
                    color: Color(0xFFB2B2D1),
                  ),
                  ListTile(
                    onTap: () {},
                    selected: false,
                    selectedColor: Theme.of(context).primaryColor,
                    leading: const Icon(
                      Iconsax.document,
                      color: Color(0xFF9F919F),
                    ),
                    title: const Text(
                      "Terms and Conditions",
                      // style: TextStyle(
                      //   color: Color(0xFF9F919F),
                      // ),
                    ),
                  ),
                  showListTile(false, const Icon(Iconsax.setting),
                      const Text("Settings"), () {}),
                  ListTile(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // backgroundColor: themeNotifier.isDark
                            //     ? Color.fromARGB(255, 39, 19, 39)
                            //     : Colors.white,
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
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Color(0xFFF337D5),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  // authService.signOut();
                                  // Navigator.of(context).pushAndRemoveUntil(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const LoginPage()),
                                  //     (route) => false);
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
                    },
                    // contentPadding:
                    //     const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    selected: false,
                    selectedColor: Theme.of(context).primaryColor,
                    leading: const Icon(
                      Iconsax.logout,
                      color: Color(0xFF9F919F),
                    ),
                    title: const Text(
                      "Log out",
                      style: TextStyle(
                        color: Color(
                          0xFFF337D5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
