import 'package:probashi/models/pagestate.dart';
import 'package:probashi/models/pagetitle.dart';
import 'package:probashi/models/signinprovider.dart';

import 'package:flutter/material.dart';
import 'package:probashi/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp( 
    MultiProvider(
      providers: [
      ChangeNotifierProvider(
        create: (_) => PageState(),
      ),
      ChangeNotifierProvider(
        create: (_) =>Signinprovider(),
        ),
      ChangeNotifierProvider(
        create: (_) => PageTitle(),
        )
    ],
    child: MyApp(),)
  
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig:AppRouter.configureRouter() ,
        debugShowCheckedModeBanner: false,
      
    );
  }
}






