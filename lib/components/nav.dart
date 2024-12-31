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
  Routes('Pre-departure Orientation', Icon(Icons.room_service_outlined), '/orientation'),
  Routes('BMET Clearance', Icon(Icons.note_outlined), '/bmet'),
  Routes('Search for Jobs', Icon(Icons.search), '/jobs'),
  Routes('Training Courses', Icon(Icons.school_outlined), '/training'),
  Routes('a2i Digital Centers', Icon(Icons.business_center_outlined), '/a2i'),
  Routes('BRAC Services', Icon(Icons.local_hospital_outlined), '/brac'),
  Routes('My Certificates', Icon(Icons.insert_drive_file_outlined), '/certificates'),
  Routes('My Documents', Icon(Icons.folder_open_outlined), '/documents'),
  Routes('Services Near Me', Icon(Icons.location_on_outlined), '/services-near-me'),
  Routes('Verify Documents', Icon(Icons.verified_outlined), '/verify-documents'),
  Routes('Visa Verification', Icon(Icons.assignment_turned_in_outlined), '/visa-verification'),
  Routes('Chat with Us', Icon(Icons.chat_outlined), '/chat'),
  Routes('Help Center', Icon(Icons.help_outline), '/help'),
  Routes('Logout', Icon(Icons.logout_outlined), '/logout'),
];

class NavDrawer extends StatelessWidget {
  final Function(String route)? onDestinationSelectedPage;

  const NavDrawer({this.onDestinationSelectedPage, super.key});

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context);

    return Container(

      width: 250,
      decoration: BoxDecoration(
        color: Colors.teal[200],
      ),
      child: Column(
        children: [
          // Profile Section
          Container(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
            decoration: BoxDecoration(
              color: Colors.teal[200],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      // width: 120,
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                      margin: const EdgeInsets.only(top: 10, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.teal[400],
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              'Eng',
                              style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'বাং',
                              style: TextStyle(fontSize: 10, color: Colors.grey[800]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.account_circle_outlined,
                        size: 40,
                        color: Colors.teal[500],
                      ),
                      onPressed: () {
                        context.push('/profile');
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit_note_outlined,
                        size: 40,
                        color: Colors.grey[800],
                      ),
                      onPressed: () {
                        context.push('/profile/edit');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Navigation List
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.teal[100]
              ),
              child: ListView.builder(
                itemCount: routes.length,
                itemBuilder: (context, index) {
                  final route = routes[index];
                  final isActive = pageState.currentRoute == route.route;

                  return ListTile(
                    leading: route.icon,
                    title: Text(
                      route.label,
                      style: TextStyle(
                        fontSize: 14,
                        color: isActive ? Colors.teal[700] : Colors.grey[800],
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      // Update current route in PageState
                      pageState.setRoute(route.route);

                      // Navigate to the selected route
                      GoRouter.of(context).go(route.route);

                      // Notify parent widget if callback is provided
                      if (onDestinationSelectedPage != null) {
                        onDestinationSelectedPage!(route.route);
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
