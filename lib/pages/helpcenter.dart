import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:probashi/models/pagetitle.dart';
import 'package:provider/provider.dart';

class HelpCenters extends StatelessWidget {
  const HelpCenters({super.key});

  Future<List<Centers>> loadJson() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/data/helpData.json');
      List<dynamic> jsonData = jsonDecode(jsonString);

      return jsonData
          .map((data) => Centers(
                title: data['title'],
                icon: IconData(data['icon'], fontFamily: 'MaterialIcons'),
                route: data['route'],
                description: data['description'],
              ))
          .toList();
    } catch (e) {
      print('Error loading JSON: $e');
      throw Exception('Failed to load JSON');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadJson(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading data ${snapshot.error}'));
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          List<Centers> centers = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal[50],
              title: Center(
                child: Text(
                  'Help Centers near me',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left_outlined,
                ),
                onPressed: () {
                  final pageState =
                      Provider.of<PageState>(context, listen: false);
                  pageState.setRoute('/home');
                  GoRouter.of(context).go('/home');
                },
                style: ButtonStyle(
                    iconSize: WidgetStateProperty.all(30),
                    padding: WidgetStatePropertyAll(EdgeInsets.only(left: 20))),
              ),
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                  ),
                  child: Column(
                    
                    children: centers.map((service) {
                      return CenterItem(item: service);
                    }).toList(),
                  ),
                )),
          );
        }
        return Center(
          child: Text('No data available'),
        );
      },
    );
  }
}

class CenterItem extends StatelessWidget {
  final Centers item;
  const CenterItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         final pageState = Provider.of<PageState>(context, listen: false);
        final title = Provider.of<PageTitle>(context, listen: false);
        title.setTitle(item.title);
        pageState.setRoute(item.route);

        GoRouter.of(context).go(item.route, extra: item.title);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.teal[50],
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height:100,
          decoration: BoxDecoration(
            color: Colors.teal[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                item.icon,
                color: Colors.black,
              ),
              SizedBox(
                width: 15,
              ),
              Flexible(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                 Flexible(
                   fit: FlexFit.loose,
                   child: Column(
                     children: [
                       Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.start,
                        softWrap: true,

                                        ),
                     ],
                   ),
                 ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Centers {
  final String title;
  final IconData icon;
  final String route;
  final String description;

  Centers(
      {required this.title,
      required this.icon,
      required this.route,
      required this.description});
}
