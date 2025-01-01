import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:provider/provider.dart';

class Servicescard extends StatelessWidget {
  const Servicescard({super.key});

  // Load JSON data from assets
  Future<List<CardItem>> loadJson() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/data/serviceData.json');
      List<dynamic> jsonData = jsonDecode(jsonString);

      // Convert the decoded data into a list of CardItem objects
      return jsonData
          .map((data) => CardItem(
                title: data['title'],
                icon:IconData(data['icon'], fontFamily: 'MaterialIcons'),
                route: data['route'],
              ))
          .toList();
    } catch (e) {
      // Log the error for debugging
      print('Error loading JSON data: $e');
      throw Exception('Failed to load JSON data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CardItem>>(
      future: loadJson(),
      builder: (context, snapshot) {
        // Handle loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Handle error state
        if (snapshot.hasError) {
          return Center(child: Text('Error loading data: ${snapshot.error}'));
        }

        // If data is loaded successfully
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          List<CardItem> cardItems = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: cardItems.map((cardItem) {
                return CardWidg(item: cardItem);
              }).toList(),
            ),
          );
        }

        return Center(child: Text('No data available'));
      },
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
        final pageState = Provider.of<PageState>(context, listen: false);
        pageState.setRoute(item.route);
        GoRouter.of(context).go(item.route);
      },
      child: Container(
        padding: EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              width: 115,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.teal[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(item.icon,
                  color: Colors.grey[800],
                  ), 
                  Center(
                    child: Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 56, 56, 56),
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem {
  final String title;
  final IconData icon;
  final String route;

  CardItem({required this.title, required this.icon, required this.route});
}
