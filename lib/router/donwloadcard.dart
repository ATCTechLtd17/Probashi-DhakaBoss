import 'package:flutter/material.dart';

class DownloadCard extends StatelessWidget {
  final Widget child;

  const DownloadCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: child,
    );
  }
}
