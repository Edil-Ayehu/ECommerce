import 'package:e_commerce_project/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:e_commerce_project/services/auth_service.dart';
import 'package:page_transition/page_transition.dart';

import '../widgets/widgets.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  bool _obscureText = true;
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

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      progressIndicator: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF750F21)),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  'Welcome back! Please enter your details',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Get.isDarkMode
                            ? Colors.white
                            : Colors.grey.shade700,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
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
                    cursorColor: Get.isDarkMode ? Colors.white70 : Colors.grey,
                    keyboardType: TextInputType.emailAddress,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
                const SizedBox(height: 15),
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
                    obscureText: _obscureText,
                    cursorColor: Get.isDarkMode ? Colors.white70 : Colors.grey,
                    decoration: InputDecoration(
                      hintText: 'password'.tr,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Get.isDarkMode
                              ? Colors.white70
                              : Colors.grey.shade600,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText =
                                !_obscureText; // Toggle password visibility
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
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const ForgotPasswordMailScreen(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                    child: Text(
                      "forgot".tr,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Get.isDarkMode
                                ? Colors.white
                                : Colors.grey.shade700,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
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
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
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
                        showErrorDialog(context,
                            'Invalid email or password. Please try again.');
                      }
                    },
                    child: Text(
                      "signin".tr,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
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
                const SizedBox(height: 40),
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
                const SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Get.off(const SignupScreen());
                      },
                      child: Text(
                        'Create',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
