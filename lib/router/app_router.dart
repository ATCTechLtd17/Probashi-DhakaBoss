import 'package:probashi/components/signout.dart';
import 'package:probashi/layout/helpLayout.dart';
import 'package:probashi/pages/documents.dart';
import 'package:probashi/pages/downloadCards/passNidData.dart';
import 'package:probashi/pages/downloadCards/passportData.dart';
import 'package:probashi/pages/downloadcards.dart';
import 'package:probashi/pages/helpItems/chat.dart';
import 'package:probashi/pages/helpItems/checklist.dart';
import 'package:probashi/pages/helpItems/countryRegulations.dart';
import 'package:probashi/pages/helpItems/faq.dart';
import 'package:probashi/pages/helpItems/verifyDocs.dart';
import 'package:probashi/pages/helpcenter.dart';
import 'package:probashi/pages/home.dart';
import 'package:probashi/pages/profile.dart';
import 'package:probashi/pages/services.dart';
import 'package:probashi/pages/signin.dart';
import 'package:probashi/layout/donwloadcardLayout.dart';
import 'package:probashi/layout/hompagewrapper.dart';
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
              path: '/download-card',
              builder: (context, state) => DownloadCards(),
            ),
            GoRoute(
              path: '/help-center',
              builder: (context, state) => HelpCenters(),
            ),
            //Help Center items route
            ShellRoute(
              builder: (context, state, child) => HelpLayout(child: child),
              routes: [
                GoRoute(
                  path: '/help',
                 builder: (context, state) => HelpCenters(),
                  routes: [
                    GoRoute(
                      path: 'verify-docs',
                      builder: (context, state) => VerifyDocs(),
                    ),
                    GoRoute(
                      path: 'checklist',
                      builder: (context, state) => Checklist(),
                    ),
                    GoRoute(
                      path: 'chat',
                      builder: (context, state) {
                        return Chat();
                      },
                    ),
                    GoRoute(
                      path: 'faq',
                      builder: (context, state) => FAQ(),
                    ),
                    GoRoute(
                      path: 'country-regulations',
                      builder: (context, state) => CountryRegulations(),
                    ),
                    
                  ],
                ),
              ],
            ),
            //Service Items route
            ShellRoute(
              builder: (context, state, child) => DownloadCardLayout(child: child),
              routes: [
                GoRoute(
                  path: '/download-cards',
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
