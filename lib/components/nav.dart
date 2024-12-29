import 'package:flutter/material.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class Routes {
  const Routes(this.label, this.icon, this.route);

  final String label;
  final Icon icon;
  final String route;
}

const List<Routes> routes = <Routes>[
  Routes('Home', Icon(Icons.home_outlined), '/home'),
  Routes('Pre-departure Orientation', Icon(Icons.room_service_outlined),
      '/orientation'),
  Routes('BMET Clearance', Icon(Icons.note_outlined), '/bmet'),
  Routes('Search for Jobs', Icon(Icons.search), '/jobs'),
  Routes('Training Courses', Icon(Icons.school_outlined), '/training'),
  Routes('a2i Digital Centers', Icon(Icons.business_center_outlined), '/a2i'),
  Routes('BRAC Services', Icon(Icons.local_hospital_outlined), '/brac'),
  Routes('My Certificates', Icon(Icons.insert_drive_file_outlined),
      '/certificates'),
  Routes('My Documents', Icon(Icons.folder_open_outlined), '/documents'),
  Routes('Services Near Me', Icon(Icons.location_on_outlined),
      '/services-near-me'),
  Routes(
      'Verify Documents', Icon(Icons.verified_outlined), '/verify-documents'),
  Routes('Visa Verification', Icon(Icons.assignment_turned_in_outlined),
      '/visa-verification'),
  Routes('Chat with Us', Icon(Icons.chat_outlined), '/chat'),
  Routes('Help Center', Icon(Icons.help_outline), '/help'),
  Routes('Login', Icon(Icons.login_outlined), '/login'),
];

class NavDrawer extends StatelessWidget {
  final Function(String route)? onDestinationSelectedPage;

  const NavDrawer({this.onDestinationSelectedPage, super.key});

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context);

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.teal[200],
          ),
          child: Column(children: [
            Container(
              width: 260,
              padding: EdgeInsets.fromLTRB(15, 50, 15, 15),
              decoration: BoxDecoration(
                  color: Colors.teal[200],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        padding: EdgeInsets.fromLTRB(2, 1, 2, 1),
                        margin: EdgeInsets.only(top: 10, right: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              // padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.teal[400],
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Eng',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[800],
                                    ),
                                  )),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'বাং',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey[800]),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //profile icon
                      Container(
                          padding: EdgeInsets.only(top: 20),
                          child: IconButton(
                            icon: Icon(
                              Icons.account_circle_outlined,
                              size: 40,
                              color: Colors.teal[500],
                            ),
                            onPressed: () {
                              context.push('/profile');
                            },
                          )),
                      //edit icon
                      Container(
                          padding: EdgeInsets.only(top: 20),
                          child: IconButton(
                            icon: Icon(Icons.edit_note_outlined,
                                size: 40, color: Colors.grey[800]),
                            onPressed: () {
                              context.push('/profile/edit');
                            },
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.teal[400],
                backgroundBlendMode: BlendMode.multiply,
              ),
              child: NavigationRail(
                destinations: routes.map((Routes route) {
                  return NavigationRailDestination(
                    icon: route.icon,
                    label: Text(
                      route.label,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
                selectedIndex:
                    routes.indexWhere((r) => r.route == pageState.currentRoute),
                extended: true,
                backgroundColor: Colors.teal[50],
                labelType: NavigationRailLabelType.none,
                onDestinationSelected: (int selectedIndex) {
                  final selectedRoute = routes[selectedIndex].route;

                  // Update current route in PageState
                  pageState.setRoute(selectedRoute);

                  // Navigate to the selected route
                  GoRouter.of(context).go(selectedRoute);

                  // Notify parent widget if callback is provided
                  if (onDestinationSelectedPage != null) {
                    onDestinationSelectedPage!(selectedRoute);
                  }
                },
                selectedIconTheme: IconThemeData(
                  color: Colors.teal[700],
                  weight: 600,
                ),
                unselectedIconTheme: IconThemeData(
                  color: Colors.grey[800],
                  weight: 400,
                ),
                useIndicator: true,
                indicatorColor: const Color.fromARGB(255, 255, 254, 254),
                indicatorShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                selectedLabelTextStyle: TextStyle(
                  color: Colors.teal[700],
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
