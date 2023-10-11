import 'package:e_commerce_project/services/reusable_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import '../widgets/widgets.dart';

class ForgotPasswordMailScreen extends StatefulWidget {
  const ForgotPasswordMailScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordMailScreen> createState() =>
      _ForgotPasswordMailScreenState();
}

class _ForgotPasswordMailScreenState extends State<ForgotPasswordMailScreen> {
  late String email;
  bool showSpinner = false;

  Future<void> resetPassword(String email) async {
    setState(() {
      showSpinner = true;
    });
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ReusableFunctions.showErrorDialog(
          context, 'Password reset email sent. Check your email.');
      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      setState(() {
        showSpinner = false;
      });
      ReusableFunctions.showErrorDialog(
          context, 'Password reset email sending failed. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      progressIndicator: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF750F21)),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 90),
                const CustomCircleAvatar(),
                const SizedBox(height: 30),
                Text(
                  'Forget Password',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 30,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter your email below to reset your password',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail, color: Colors.black),
                    hintText: "E-mail",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF750F21),
                    ),
                    onPressed: () {
                      resetPassword(email);
                    },
                    child: const Text('Reset Password'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
