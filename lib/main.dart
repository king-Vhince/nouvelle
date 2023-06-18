import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import '../pages/home_page.dart';
import '../service/helper_functions.dart';
// import 'package:testingapp/service/theme_provider.dart';
// import 'package:testingapp/widget/my_bottom_navBar.dart';
import 'auth/login_page.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter_animated_theme/animated_theme_app.dart';
// import 'package:flutter_animated_theme/animation_type.dart';
// import 'package:flutter_animated_theme/circular_animation/';

import 'auth/signup_page.dart';
// import 'widget/persistent_bottom_navbar.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();

    getUserLoggedInStatus();
  }

  void getUserLoggedInStatus() async {
    // setState(() async {
    //   _isSignedIn = await HelperFunction.getUserLoggedInStatus() ?? false;
    // });

    await HelperFunction.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _mainNavigatorKey = GlobalKey<NavigatorState>();

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      navigatorKey: _mainNavigatorKey,
      // animationDuration: const Duration(milliseconds: 500),
      // animationType: AnimationType.CIRCULAR_ANIMATED_THEME,
      debugShowCheckedModeBanner: false,

      home: _isSignedIn ? HomePage() : const SignUpPage(),
    );
  }
}
