import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../service/helper_functions.dart';

import 'auth/login_page.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth/signup_page.dart';

void main() async {
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
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? HomePage() : const SignUpPage(),
    );
  }
}
