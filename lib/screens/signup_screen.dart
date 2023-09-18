import 'package:e_commerce_project/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;

  late String uname;
  late String email;
  late String password;
  late String confirmPassword;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.off(const HomePage());
            },
            child: Text(
              'GetStarted',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 20),
            ),
          ),
          const SizedBox(width: 25),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('images/eaglelion.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Register',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    'Start Your Shopping Journey with Us',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.grey.shade700
                          : Colors.white60,
                      borderRadius: BorderRadius.circular(12),
                      border: Get.isDarkMode
                          ? null
                          : Border.all(color: Colors.grey.shade400, width: 1),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        uname = value;
                      },
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      cursorColor: Colors.white70,
                      decoration: const InputDecoration(
                        hintText: 'Username',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.grey.shade700
                          : Colors.white60,
                      borderRadius: BorderRadius.circular(12),
                      border: Get.isDarkMode
                          ? null
                          : Border.all(color: Colors.grey.shade400, width: 1),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      cursorColor: Colors.white70,
                      decoration: const InputDecoration(
                        hintText: 'Enter email',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.grey.shade700
                          : Colors.white60,
                      borderRadius: BorderRadius.circular(12),
                      border: Get.isDarkMode
                          ? null
                          : Border.all(color: Colors.grey.shade400, width: 1),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      obscureText: _obscurePassword,
                      cursorColor: Colors.white70,
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Get.isDarkMode
                                ? Colors.white70
                                : Colors.grey.shade600,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword =
                                  !_obscurePassword; // Toggle password visibility
                            });
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.grey.shade700
                          : Colors.white60,
                      borderRadius: BorderRadius.circular(12),
                      border: Get.isDarkMode
                          ? null
                          : Border.all(color: Colors.grey.shade400, width: 1),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                      obscureText: _obscureConfirmPassword,
                      cursorColor: Colors.white70,
                      decoration: InputDecoration(
                        hintText: 'Confirm password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Get.isDarkMode
                                ? Colors.white70
                                : Colors.grey.shade600,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword; // Toggle password visibility
                            });
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF750F21),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: () async {
                        // Check if passwords match
                        if (password == confirmPassword) {
                          setState(() {
                            showSpinner = true;
                          });

                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );

                            if (newUser != null) {
                              Get.off(const HomePage());
                            }

                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          setState(() {
                            Fluttertoast.showToast(
                              msg:
                                  "The entered passwords do not match. Please try again.",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                            );
                          });
                        }
                      },
                      child: Text(
                        "Sign up",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          Get.off(SigninScreen());
                        },
                        child: Text(
                          'Sign in',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'By creating an account, you agree to the ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
