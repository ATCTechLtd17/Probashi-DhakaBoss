import 'package:probashi/components/bottomnav.dart';
import 'package:probashi/components/nav.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:probashi/models/signinprovider.dart';
import 'package:probashi/pages/bmet.dart';
import 'package:probashi/pages/documents.dart';
import 'package:probashi/pages/govt.dart';
import 'package:probashi/pages/home.dart';
import 'package:probashi/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:probashi/pages/signin.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

void main() {
  
  runApp( 
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => PageState(),
      ),
      ChangeNotifierProvider(
        create: (_) =>Signinprovider(),
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
        routerConfig: GoRouter(
          initialLocation: '/home',
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePageWrapper(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) =>
                  const HomePageWrapper(),
            ),
            GoRoute(
              path: '/documents',
              builder: (context, state) =>
                  const HomePageWrapper(),
            ),
            GoRoute(
              path: '/govt',
              builder: (context, state) =>
                  const HomePageWrapper(),
            ),
            GoRoute(
              path: '/bmet',
              builder: (context, state) =>
                  const HomePageWrapper(),
            ),
            GoRoute(
              path: '/login',
              builder: (context, state) =>
                  const Signin(),
            ),
          ],
        ),
        debugShowCheckedModeBanner: false,
      
    );
  }
}

class HomePageWrapper extends StatelessWidget {
  
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Correctly accessing the PageState using Provider
    final pageState = Provider.of<PageState>(context);

  Widget getPage(String route){
    switch (route){
      case '/home':
        return Home();
      case '/profile':
        return ProfileView();
      case '/documents':
        return Document();
      case '/govt':
        return Govt();
      case '/bmet':
        return BMET();
        
      default:
        return Home();
    }
  }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 5,
            ),
          ],
        ),
        leadingWidth: 50,
        actions: [
          IconButton(
            icon: Icon(Icons.mail_outlined),
            color: Colors.teal[700],
            padding: const EdgeInsets.only(right: 30),
            onPressed: () {
              GoRouter.of(context).go('/notifications');
            },
          ),
        ],
      ),
      drawer: NavDrawer(
        onDestinationSelectedPage: (route) {
          GoRouter.of(context).go(route);
        },
      ),
      body:
      getPage(pageState.currentRoute),
      bottomNavigationBar: BottomNav(),
    );
  }
}




