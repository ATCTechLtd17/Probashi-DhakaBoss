import 'package:probashi/components/bottomnav.dart';
import 'package:probashi/components/signout.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:probashi/models/signinprovider.dart';
import 'package:probashi/pages/bmet.dart';
import 'package:probashi/pages/documents.dart';
import 'package:probashi/pages/downloadcards.dart';
import 'package:probashi/pages/govt.dart';
import 'package:probashi/pages/helpcenter.dart';
import 'package:probashi/pages/home.dart';
import 'package:probashi/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:probashi/pages/services.dart';
import 'package:probashi/pages/signin.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

void main() {
  
  runApp( 
    MultiProvider(
      providers: [
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
          initialLocation: '/documents',
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomePageWrapper(),
            ),
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
                const  HomePageWrapper()
            ),
            GoRoute(
              path: '/govt',
              builder: (context, state) =>
                  const HomePageWrapper(),
            ),
            GoRoute(
              path: '/services',
              builder: (context, state) =>
              const HomePageWrapper(),
            ),
            GoRoute(
              path: '/help-center',
              builder: (context, state) =>
              const HomePageWrapper(),
            ),
            GoRoute(
              path: '/download-card',
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
            GoRoute(
              path: '/logout',
              builder: (context, state) =>
                  const SignOut(),
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
      case '/':
        return Home();
      case '/profile':
        return ProfileView();
        
      case '/home':
        return Home();
      case '/govt':
        return Govt();
      case '/bmet':
        return BMET();
      case '/documents':
        return Document();
      case '/services':
        return Services();
      case '/help-center':
        return HelpCenters();
      case '/download-card':
        return DownloadCards();
        
      default:
        return Home();
    }
  }

    return Scaffold(
      
      body: getPage(pageState.currentRoute),

      bottomNavigationBar: BottomNav(),
    );
  }
}




