import 'package:flutter/material.dart';

class DownloadCardLayout extends StatelessWidget {
  final Widget child;

  const DownloadCardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: child,
    );
  }
}
