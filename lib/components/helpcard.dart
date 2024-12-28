import 'package:flutter/material.dart';

class HelpCard extends StatelessWidget {
  HelpCard({super.key});

  final List<CardItem> cardItems = [
    CardItem(
      title: 'Verify Documents',
      icon: Icons.home,
      route: '/bmet-form',
    ),
    CardItem(
      title: 'Visa Verification ',
      icon: Icons.home,
      route: '/search-job',
    ),
    CardItem(
      title: 'Checklist',
      icon: Icons.home,
      route: '/pdo',
    ),
    CardItem(
      title: 'Chat with us ',
      icon: Icons.home,
      route: '/bmet-clearance',
    ),
    CardItem(
      title: 'FAQ ',
      icon: Icons.home,
      route: '/bmet-clearance',
    ),
    CardItem(
      title: 'Country Specific regulations ',
      icon: Icons.home,
      route: '/bmet-clearance',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: cardItems.map((cardItem) {
        return CardWidg(item: cardItem);
      }).toList()),
    );
  }
}

class CardWidg extends StatelessWidget {
  final CardItem item;

  const CardWidg({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, item.route, arguments: item);
      },
      child: Expanded(
        child: Container(
          padding: EdgeInsets.only(right: 12),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                width: 110,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.teal[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: Color.fromARGB(255, 56, 56, 56),
                      ),
                      Text(item.title,
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 56, 56, 56))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem {
  final String title;
  final IconData icon;
  final String route;

  CardItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}
