import 'package:flutter/material.dart';

class HelpLayout extends StatelessWidget {
  final Widget child;

  const HelpLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
