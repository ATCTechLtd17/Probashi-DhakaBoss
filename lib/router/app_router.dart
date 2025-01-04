import 'package:probashi/components/signout.dart';
import 'package:probashi/models/pagetitle.dart';
import 'package:probashi/pages/documents.dart';
import 'package:probashi/pages/downloadCards/passNidData.dart';
import 'package:probashi/pages/downloadCards/passportData.dart';
import 'package:probashi/pages/downloadcards.dart';
import 'package:probashi/pages/helpcenter.dart';
import 'package:probashi/pages/home.dart';
import 'package:probashi/pages/profile.dart';
import 'package:probashi/pages/services.dart';
import 'package:probashi/pages/signin.dart';
import 'package:probashi/router/donwloadcard.dart';
import 'package:probashi/router/hompagewrapper.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter configureRouter() {
    return GoRouter(
      initialLocation: '/',
      routes: [
        ShellRoute(
          builder: (context, state, child) => HomePageWrapper(child: child),
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => Home(),
            ),
            GoRoute(
              path: '/home',
              builder: (context, state) => Home(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => ProfileView(),
            ),
            GoRoute(
              path: '/documents',
              builder: (context, state) => Document(),
            ),
            GoRoute(
              path: '/services',
              builder: (context, state) => Services(),
            ),
            GoRoute(
              path: '/help-center',
              builder: (context, state) => HelpCenters(),
            ),
            ShellRoute(
              builder: (context, state, child) => DownloadCard(child: child),
              routes: [
                GoRoute(
                  path: '/download-card',
                  builder: (context, state) => DownloadCards(),
                  routes: [
                    GoRoute(
                      path: 'bmet-clearance',
                      builder: (context, state) => PassportData(),
                    ),
                    GoRoute(
                      path: 'pdo-cert-housekeeping',
                      builder: (context, state) => PassNidData(),
                    ),
                    GoRoute(
                      path: 'training-cert',
                      builder: (context, state) {
                        return PassNidData();
                      },
                    ),
                    GoRoute(
                      path: 'training-enroll',
                      builder: (context, state) => PassNidData(),
                    ),
                    GoRoute(
                      path: 'pdo-cert',
                      builder: (context, state) => PassportData(),
                    ),
                    GoRoute(
                      path: 'pdo-enroll',
                      builder: (context, state) => PassportData(),
                    ),
                    GoRoute(
                      path: 'bmet-registration',
                      builder: (context, state) => PassportData(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => Signin(),
        ),
        GoRoute(
          path: '/logout',
          builder: (context, state) => SignOut(),
        ),
      ],
    );
  }
}
