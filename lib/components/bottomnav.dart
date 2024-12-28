import 'package:flutter/material.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context, listen: false);

    final List<Map<String, dynamic>> navItems = [
      {'label': 'Home', 'icon': Icons.home_outlined, 'route': '/home'},
      {
        'label': 'Documents',
        'icon': Icons.folder_shared_outlined,
        'route': '/documents'
      },
      {
        'label': 'Profile',
        'icon': Icons.account_circle_sharp,
        'route': '/profile'
      },
    ];

    final currIndex =
        navItems.indexWhere((item) => item['route'] == pageState.currentRoute);

    return BottomNavigationBar(
      currentIndex: currIndex == -1 ? 0 : currIndex,
      onTap: (int index) {
        final selectedRoute = navItems[index]['route'];
        if (pageState.currentRoute != selectedRoute) {
          pageState.setRoute(selectedRoute);
          GoRouter.of(context).go(selectedRoute);
        }
      },
      items: navItems.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item['icon']),
          label: item['label'],
        );
      }).toList(),
      selectedItemColor: Colors.teal[700],
      unselectedItemColor: Colors.grey[700],
      backgroundColor: Colors.teal[50],
      type: BottomNavigationBarType.fixed,
    );
  }
}
