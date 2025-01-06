import 'package:flutter/material.dart';
import 'package:probashi/components/bottomnav.dart';

class HomePageWrapper extends StatelessWidget {
  final Widget child;

  const HomePageWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNav(),
    );
  }
}
