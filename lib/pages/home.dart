import 'package:go_router/go_router.dart';
import 'package:probashi/components/helpcard.dart';
import 'package:probashi/components/nav.dart';
import 'package:probashi/components/servicescard.dart';
import 'package:probashi/components/slidercard.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 5,
            ),
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
                                onPressed: () {},
                                child: Text(
                                  'View all (11)',
                                  style: TextStyle(color: Colors.grey[700]),
                                ))
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
                            TextButton(onPressed: (){},
                             child: Text('View all (6)',
                             style: TextStyle(
                              color: Colors.grey[700]
                             ),
                             ))
                            
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