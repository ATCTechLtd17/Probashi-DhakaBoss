
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:probashi/models/pagetitle.dart';
import 'package:provider/provider.dart';

class DownloadCard extends StatelessWidget {
  final Widget child;

  const DownloadCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final titleProvider = Provider.of<PageTitle>(context);
    final title =
        titleProvider.title.isNotEmpty ? titleProvider.title : 'Default Title';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[50],
        title: Center(child: Text(title)),
        leading: IconButton(
          icon: Icon(Icons.chevron_left_outlined),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            } else {
              
              GoRouter.of(context).go('/download-card');
            }
          },
        ),
      ),
      body: child,
    );
  }
}
