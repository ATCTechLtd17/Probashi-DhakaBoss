import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  Future<List<Service>> loadJson() async {
    try{
      String jsonString = await rootBundle.loadString('assets/data/cardData.json');
      List<dynamic>jsonData = jsonDecode(jsonString);

      return jsonData.map((data)=> Service(
        title: data['title'],
        icon: IconData(data['icon'],
        fontFamily: 'MaterialIcons'
        ),
        route: data['route'],
      )).toList();
    } catch(e){
      print('Error loading JSON: $e');
      throw Exception('Failed to load JSON');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: loadJson(),
    builder: (context, snapshot){
      if (snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError){
        return Center(child: Text('Error loading data ${snapshot.error}'));
      }
      if (snapshot.hasData && snapshot.data!.isNotEmpty){
        List<Service> services = snapshot.data!;

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: services.map((service){
              return ServiceItem(item: service);
            }
          ).toList(),
        )
        );
      }
      return Center(child: Text('No data available'),);
    },
    );
  }
}

class ServiceItem extends StatelessWidget {
  final Service item;
  const ServiceItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push(item.route, extra: item);
      },
       child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.teal[50],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text('Services Near me',
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontWeight: FontWeight.w600
                  ),
                  )
                ],
              ),
            ),
            Container(
              // padding: EdgeInsets.all(8),
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.teal[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
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
   
    ) ;
  }
}


class Service{
  final String title;
  final IconData icon;
  final String route;

  Service({required this.title, required this.icon, required this.route});
}