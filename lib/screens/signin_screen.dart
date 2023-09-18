import 'package:e_commerce_project/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.off(const HomePage());
            },
            child: Text(
              'Skip',
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('images/eaglelion.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sign in',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Welcome back! Please enter your details',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
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
                      cursorColor: Colors.white70,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
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
                      obscureText: _obscureText,
                      cursorColor: Colors.white70,
                      decoration: InputDecoration(
                        hintText: 'Enter password',
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
                        }
                      },
                      child: Text(
                        "Sign in",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot your password?",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 60),
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
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 18),
                        ),
                      ),
                    ],
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
