import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:provider/provider.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  Future<List<Service>> loadJson() async {
    try{
      String jsonString = await rootBundle.loadString('assets/data/serviceData.json');
      List<dynamic>jsonData = jsonDecode(jsonString);

      return jsonData.map((data)=> Service(
        title: data['title'],
        icon: IconData(data['icon'],
        fontFamily: 'MaterialIcons'
        ),
        route: data['route'],
        description: data['description'],
        
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

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal[50],
            title: Center(
              child: Text('Services near me',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
              ),
            ),
            leading: 
              IconButton(icon: Icon(Icons.chevron_left_outlined,),
              onPressed: () {
                
                final pageState =
                        Provider.of<PageState>(context, listen: false);
                    pageState.setRoute('/home');
                    GoRouter.of(context).go('/home');
              },
              style: ButtonStyle(
                iconSize: WidgetStateProperty.all(30),
                padding: WidgetStatePropertyAll(EdgeInsets.only(left: 20))
              ),
              ),
            
          ),
          body: 
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: services.map((service){
                return ServiceItem(item: service);
              }
            ).toList(),
          )
          ),
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
        final pageState = Provider.of<PageState>(context, listen: false);
        pageState.setRoute(item.route);
        GoRouter.of(context).go(item.route);
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
             SizedBox(width: 15,),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
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
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.start,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
            
            ] 
            ),
           ],
         ),
                    ),
      ),
   
    ) ;
  }
}


class Service{
  final String title;
  final IconData icon;
  final String route;
  final String description;

  Service({required this.title, required this.icon, required this.route, required this.description});
}