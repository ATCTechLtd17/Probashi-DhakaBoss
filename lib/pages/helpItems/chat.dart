import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:probashi/models/pagetitle.dart';
import 'package:provider/provider.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
    Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context);
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
            pageState.setRoute('/help-center');
            GoRouter.of(context).pop('/help-center');
          },
        ),
      ),
      body: Text('ccc'),
    );
  }
}
