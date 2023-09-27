import 'package:e_commerce_project/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

import '../services/auth_service.dart';
import '../widgets/widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  late String confirmPassword;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  bool showSpinner = false;

  // Function to show an error dialog
  void showErrorDialog(ctx, String errorMessage) {
    showCupertinoDialog(
        context: ctx,
        builder: (_) => CupertinoAlertDialog(
              title: const Text("Error"),
              content: Text(errorMessage),
              actions: [
                CupertinoButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Color(0xFF750F21),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  // Function to validate if the text fields are empty
  bool isTextFieldEmpty(String text) {
    return text.trim().isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF750F21)),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.off(const HomePage());
                      },
                      child: Text(
                        'skip'.tr,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 20,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : const Color(0xFF750F21),
                                ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 55),
                const CustomCircleAvatar(),
                const SizedBox(height: 35),
                Text(
                  'Start Your Shopping Journey with Us',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Get.isDarkMode
                            ? Colors.white
                            : Colors.grey.shade700,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color:
                        Get.isDarkMode ? Colors.grey.shade700 : Colors.white60,
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
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    cursorColor: Get.isDarkMode ? Colors.white70 : Colors.grey,
                    decoration: InputDecoration(
                      hintText: 'email'.tr,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color:
                        Get.isDarkMode ? Colors.grey.shade700 : Colors.white60,
                    borderRadius: BorderRadius.circular(12),
                    border: Get.isDarkMode
                        ? null
                        : Border.all(color: Colors.grey.shade400, width: 1),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    obscureText: _obscurePassword,
                    cursorColor: Get.isDarkMode ? Colors.white70 : Colors.grey,
                    decoration: InputDecoration(
                      hintText: 'password'.tr,
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
                const SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color:
                        Get.isDarkMode ? Colors.grey.shade700 : Colors.white60,
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
                    cursorColor: Get.isDarkMode ? Colors.white70 : Colors.grey,
                    decoration: InputDecoration(
                      hintText: 'confirmPass'.tr,
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
                const SizedBox(height: 20),
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
                      // Check if any text field is empty
                      if (isTextFieldEmpty(email) ||
                          isTextFieldEmpty(password) ||
                          isTextFieldEmpty(confirmPassword)) {
                        Fluttertoast.showToast(
                          msg: "Please enter all fields",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: const Color(0xFF750F21),
                        );
                        return;
                      }

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
                          setState(() {
                            showSpinner = false;
                          });
                          // Show an error dialog with the error message
                          showErrorDialog(
                              context, 'Sign-up failed. Please try again.');
                        }
                      } else {
                        setState(() {
                          Fluttertoast.showToast(
                            msg:
                                "The entered passwords do not match. Please try again.",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: const Color(0xFF750F21),
                          );
                        });
                      }
                    },
                    child: Text(
                      "signup".tr,
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
                  children: [
                    Expanded(
                      child:
                          Divider(thickness: 0.5, color: Colors.grey.shade400),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'continue'.tr,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                          Divider(thickness: 0.5, color: Colors.grey.shade400),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        try {
                          setState(() {
                            showSpinner = true;
                          });
                          await AuthService().signInWithGoogle();
                          setState(() {
                            showSpinner = false;
                          });
                          Get.to(const HomePage());
                        } catch (e) {
                          print(e);
                          setState(() {
                            showSpinner = false;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Image.asset(
                          'images/google.png',
                          height: 40,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Image.asset(
                          'images/facebook.png',
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
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
                        'signin'.tr,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 18,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : const Color(0xFF750F21),
                                ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 10),
                // RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //       text: 'By creating an account, you agree to the ',
                //       style: Theme.of(context).textTheme.bodyMedium,
                //       children: [
                //         TextSpan(
                //           text: 'Terms and Conditions',
                //           style:
                //               Theme.of(context).textTheme.bodyMedium?.copyWith(
                //                     decoration: TextDecoration.underline,
                //                   ),
                //         ),
                //         TextSpan(
                //           text: ' and ',
                //           style: Theme.of(context).textTheme.bodyMedium,
                //         ),
                //         TextSpan(
                //           text: 'Privacy Policy',
                //           style:
                //               Theme.of(context).textTheme.bodyMedium?.copyWith(
                //                     decoration: TextDecoration.underline,
                //                   ),
                //         ),
                //       ]),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
