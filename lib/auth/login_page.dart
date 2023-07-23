import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nouvelle/pages/home_page.dart';

import '../service/helper_functions.dart';

import '../service/database_service.dart';
import '../widgets/large_widgets/my_TextFormField.dart';
import '../widgets/small_widgets.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String userName = "";
  // AuthService authService = AuthService();
  bool _isLoading = false;
  bool isButtonActive = true;
  bool isNotVisible = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        // gradient background, Logo(Icon), Welcome text
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 9.0, left: 9.0, right: 9.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                  'assets/images/Banner_Image2.png',
                                ),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                  const Color.fromARGB(255, 78, 30, 76)
                                      .withOpacity(0.97),
                                  BlendMode.darken,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(13),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF1C1A28),
                                  Color(0xFF762672),
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            width: width,
                            padding: const EdgeInsets.all(8.0),
                            height: height * 0.34,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/headphonesChatapp.png',
                                  width: 100,
                                  height: 100,
                                ),
                                const SizedBox(
                                  height: 7,
                                ),

                                // Welcome Text
                                const Text(
                                  "Log in",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      letterSpacing: 1),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),

                                // Create an account
                                const Text(
                                  "Continue from were you stopped...",
                                  // "Log in to join the action",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 209, 205, 205),
                                  ),
                                ),

                                const SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // Email Field
                        InputForm(
                          obscureText: false,
                          hintText: "Email",
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          validator: (value) {
                            return RegExp(
                                        r"^([a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,8})(\.[a-z]{2,8})?$")
                                    .hasMatch(value!)
                                ? null
                                : "Please enter a valid email address";
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // Password Field

                        InputForm(
                          obscureText: isNotVisible ? true : false,
                          hintText: "Password",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              height: 35,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isNotVisible = !isNotVisible;
                                  });
                                },
                                icon: isNotVisible
                                    ? const Icon(
                                        Iconsax.eye_slash,
                                        size: 18,
                                      )
                                    : const Icon(
                                        Iconsax.eye,
                                        size: 18,
                                      ),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          validator: (value) {
                            if (value!.length < 6) {
                              return "password is short";
                            } else {
                              return null;
                            }
                          },
                        ),

                        const SizedBox(
                          height: 4,
                        ),

                        GestureDetector(
                          onTap: () {},
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 48),
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(
                                  color: Color(0xFFF07631),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 18,
                        ),

                        // Sign up button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 49.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: password.isNotEmpty &&
                                        email.isNotEmpty
                                    ? const LinearGradient(
                                        colors: [
                                          Color(0xFFA909A1),
                                          Color.fromARGB(255, 73, 122, 212),
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      )
                                    : const LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 240, 202, 238),
                                          Color.fromARGB(255, 206, 218, 241),
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ElevatedButton(
                                onPressed: password.isNotEmpty &&
                                        email.isNotEmpty
                                    ? (() {
                                        // login();
                                        if (formkey.currentState!.validate()) {
                                          setState(() {
                                            _isLoading = true;
                                          });
                                          FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: email,
                                                  password: password)
                                              .then((value) async {
                                            QuerySnapshot snapshot =
                                                await DatabaseService(
                                                        uid: FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)
                                                    .getUserData(email);
                                            HelperFunction
                                                .saveUserLoggedInStatus(true);
                                            HelperFunction.saveUserEmailPrefs(
                                                email);

                                            nextScreenReplacement(
                                                context, HomePage());
                                          }).onError((error, stackTrace) {
                                            setState(() {
                                              _isLoading = false;
                                            });
                                            print("error: ${error.toString()}");
                                            showSnackBar(context, Colors.purple,
                                                error.toString());
                                          });
                                        }
                                      })
                                    : null,
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor:
                                        Color.fromARGB(0, 194, 51, 187),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: password.isNotEmpty &&
                                            email.isNotEmpty
                                        ? Colors.white
                                        : Color.fromARGB(255, 235, 230, 230),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 28,
                        ),

                        // Continue with
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 49.0),
                          child: Center(
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Divider(
                                    color: Color.fromARGB(255, 139, 134, 139),
                                  ),
                                ),
                                SizedBox(width: 14),
                                Text(
                                  "Or sign in with",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 141, 128, 138),
                                    fontSize: 13.8,
                                  ),
                                ),
                                SizedBox(width: 14),
                                Expanded(
                                  child: Divider(
                                    color: Color.fromARGB(255, 139, 134, 139),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 28,
                        ),
                        // Signup Options
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Google
                            Container(
                              decoration: signUpOptionsBoxDec,
                              child: SizedBox(
                                height: 43,
                                width: 53,
                                child: Image.asset(
                                  'assets/icons/Google_logo.png',
                                  scale: 1.1,
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 45,
                            ),

                            // Apple
                            Container(
                              decoration: signUpOptionsBoxDec,
                              child: SizedBox(
                                height: 43, // 8 %
                                width: 53,
                                child: Image.asset(
                                  'assets/icons/Apple_logo.png',
                                  scale: 1.1,
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 45,
                            ),

                            // Facebook
                            Container(
                              decoration: signUpOptionsBoxDec,
                              child: SizedBox(
                                height: 43,
                                width: 53,
                                child: Image.asset(
                                  'assets/icons/Facebook_logo.png',
                                  scale: 1.1,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 28,
                        ),

                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: "Don't have an account? "),
                              TextSpan(
                                text: "Sign Up",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(context, const SignUpPage());
                                  },
                                style: const TextStyle(
                                  // color: Color(0xFF1E9AD2),
                                  color: Color(0xFFF07631),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
