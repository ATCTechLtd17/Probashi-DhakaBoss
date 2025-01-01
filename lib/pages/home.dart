import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:probashi/components/helpcard.dart';
import 'package:probashi/components/nav.dart';
import 'package:probashi/components/servicescard.dart';
import 'package:probashi/components/slidercard.dart';
import 'package:flutter/material.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  // dynamically count data length
  Future<int> loadHelpDataLength() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/helpData.json');
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.length;
    } catch (e) {
      print('Error loading JSON: $e');
      return 0; // Return 0 if there's an error
    }
  }
  Future<int> loadServiceDataLength() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/serviceData.json');
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.length;
    } catch (e) {
      print('Error loading JSON: $e');
      return 0; // Return 0 if there's an error
    }
  }

  @override
  Widget build(BuildContext context) {
    

    return 
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        title: Row(
          children: [
            Text('Probashi',
        style: TextStyle(
          color: Colors.teal[600]
        ),
        ),
            Text('DhakaBoss',
            style: TextStyle(
              color: Colors.grey[400]
            ),
            )
            // Image.asset(
            //   'assets/images/logo.png',
            //scale: 5,
         ],


        ),
        leadingWidth: 50,
        actions: [
          IconButton(
            icon: Icon(Icons.mail_outlined),
            color: Colors.teal[700],
            padding: const EdgeInsets.only(right: 30),
            onPressed: () {
              GoRouter.of(context).go('/notifications');
            },
          ),
        ],
      ),
      drawer: NavDrawer(
        onDestinationSelectedPage: (route) {
          GoRouter.of(context).go(route);
        },
      ),
     
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          // child: Container(
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100],
              
          //   ),
           child: Column(
             children: [
               Container(
                padding: EdgeInsets.only(left: 16, bottom: 30, top: 10),
                decoration: BoxDecoration(
                      color: Colors.teal[100],
                    ),
                 child: Column(
                   children: [
                    Row(children: [
                      Text('Begin your journey abroad',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        
                      ),
                      ),
                      Icon(Icons.chevron_right_outlined,
                      color: Colors.grey[500],
                      size: 30 ,
                      )
                    ],),
                    
                     Container(
                      padding: EdgeInsets.only(top:10),
                      child:
                       SliderCard(),
                       ),
                   ],
                 ),
               ),
               Container(
                  padding: EdgeInsets.only(left: 16, bottom: 20, top: 10),
                  margin: EdgeInsets.only(top: 20),
                  
                  decoration: BoxDecoration(
                      color: Colors.teal[100],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                 Text(
                              'Services Near me',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_outlined,
                              color: Colors.grey[500],
                              size: 30,
                            ),
                              ],
                            ),

                            TextButton(
                              onPressed: () {
                                try {
                                  final pageState = Provider.of<PageState>(
                                    context,
                                    listen: false);
                                pageState.setRoute('/services');
                                  GoRouter.of(context).go('/services'); 
                                } catch (e) {
                                  print('Error navigating to /services: $e');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Navigation failed: $e')),
                                  );
                                }
                              },
                              child:  FutureBuilder<int>(
                              future: loadServiceDataLength(),
                              builder: (context, snapshot) {
                                 if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    // Show a loading indicator while the data is being loaded
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    // Handle errors
                                    return Text(
                                      'Error loading data',
                                      style: TextStyle(color: Colors.red),
                                    );
                                  } 
                                  else{
                                    final int length = snapshot.data ?? 0;
                                    return Text(
                                  'View all ($length)',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 16, // Adjust font size if needed
                                    fontWeight: FontWeight
                                        .w500, // Optional: Add weight for emphasis
                                  ),
                                );}
                              }
                            ),
                          ),

                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Servicescard(),
                        ),
                        
                      ],
                      
                    ),
                    
                    ),
                            Container(
                    padding: EdgeInsets.only(left: 16, bottom: 20, top: 10),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                 Text(
                              'Help center',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_outlined,
                              color: Colors.grey[500],
                              size: 30,
                            )
                              ],
                             
                            ),
                            TextButton(
                            onPressed: () {
                              try {
                                final pageState = Provider.of<PageState>(
                                    context,
                                    listen: false);
                                pageState.setRoute('/help-center');
                                GoRouter.of(context).go('/help-center');
                              } catch (e) {
                                print('Error navigating to /services: $e');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Navigation failed: $e')),
                                );
                              }
                            },
                            child: FutureBuilder<int>(
                              future: loadHelpDataLength(),
                              builder: (context, snapshot) {
                                 if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    // Show a loading indicator while the data is being loaded
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    // Handle errors
                                    return Text(
                                      'Error loading data',
                                      style: TextStyle(color: Colors.red),
                                    );
                                  } 
                                  else{
                                    final int length = snapshot.data ?? 0;
                                    return Text(
                                  'View all ($length)',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 16, // Adjust font size if needed
                                    fontWeight: FontWeight
                                        .w500, // Optional: Add weight for emphasis
                                  ),
                                );}
                              }
                            ),
                          ),
                            
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: HelpCard(),
                        ),
                      ],
                    ),
                  ),
                   
            
             ],
           )
          ),
        // ),
      ),
    );
     
  }
}