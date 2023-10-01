import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AutoSignoutDetector extends StatefulWidget {
  final Widget child;

  const AutoSignoutDetector({super.key, required this.child});

  @override
  _AutoSignoutDetectorState createState() => _AutoSignoutDetectorState();
}

class _AutoSignoutDetectorState extends State<AutoSignoutDetector> {
  final _auth = FirebaseAuth.instance;
  Timer? _idleTimer;
  final Duration _idleTimeout = const Duration(minutes: 10);

  void _resetTimer() {
    _idleTimer?.cancel();
    _idleTimer = Timer(_idleTimeout,
        _signOutUser); // Sign the user out when the timer expires.
  }

  void _signOutUser() {
    _auth.signOut();
    GoogleSignIn().signOut();
  }

  @override
  void initState() {
    super.initState();
    _resetTimer();
  }

  @override
  void didUpdateWidget(covariant AutoSignoutDetector oldWidget) {
    super.didUpdateWidget(oldWidget);
    _resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _resetTimer,
      onPanDown: (D) => _resetTimer,
      onScaleUpdate: (D) => _resetTimer,
      child: widget.child,
    );
  }
}
