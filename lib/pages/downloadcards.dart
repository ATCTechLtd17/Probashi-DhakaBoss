import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:go_router/go_router.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:probashi/models/pagetitle.dart';
import 'package:provider/provider.dart';

class DownloadCards extends StatelessWidget {
  const DownloadCards({super.key});

  Future<List<CardsCerts>> loadJson() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/data/downloadCardData.json');
      List<dynamic> jsonData = jsonDecode(jsonString);

      return jsonData
          .map((data) => CardsCerts(
                title: data['title'],
                icon: IconData(data['icon'], fontFamily: 'MaterialIcons'),
                route: data['route'],
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
          List<CardsCerts> cert = snapshot.data!;

          return Scaffold(
            backgroundColor: Colors.teal[50],
            appBar: AppBar(
              backgroundColor: Colors.teal[50],
              title: Center(
                child: Column(
                  children: [
                    Text(
                      'Download Cards and Certificates from here',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        
                    ),
                    SizedBox(height: 7),
                    
                    Text(
                      'Select  any service from the list to download',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        
                    ),
                  ],
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
            body: Container(
              margin: EdgeInsets.only(top:20),
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: cert.map((service) {
                      return CertItem(item: service);
                    }).toList(),
                  )),
            ),
          );
        }
        return Center(
          child: Text('No data available'),
        );
      },
    );
  }
}

class CertItem extends StatelessWidget {
  final CardsCerts item;
  const CertItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final pageState = Provider.of<PageState>(context, listen: false);
        final title =  Provider.of<PageTitle>(context, listen: false);
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
          height: 80,
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                ]),
            ],
          ),
        ),
      ),
    );
  }
}

class CardsCerts {
  final String title;
  final IconData icon;
  final String route;

  CardsCerts(
      {required this.title,
      required this.icon,
      required this.route,});
}
