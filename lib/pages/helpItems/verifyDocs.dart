import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:probashi/models/pagetitle.dart';
import 'package:provider/provider.dart';

class VerifyDocs extends StatelessWidget {
  const VerifyDocs({super.key});

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context);
    final titleProvider = Provider.of<PageTitle>(context);
    final title =
        titleProvider.title.isNotEmpty ? titleProvider.title : 'Default Title';
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.teal[50],
        title: Center(child: Text(title)),
        leading: IconButton(
          icon: Icon(Icons.chevron_left_outlined),
          onPressed: () {
            pageState.setRoute('/help-center');
            GoRouter.of(context).pop('/help-center');
          },
        ),
      ),
      body: Flexible(
        fit: FlexFit.loose,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child:
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Flexible(
                fit: FlexFit.loose,
                child: Column(
                  children: [
                    Image.asset('assets/images/verify_phone_human.jpg',
                    colorBlendMode: BlendMode.darken,
                    width: 250,
                    fit: BoxFit.cover,
                    ),
                    SizedBox(height: 15,),
                    Text('Verify Documents by scanning the QR code on your card',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
              ),
            )),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider( color: Colors.grey[500], height: 1,),
            ),
            SizedBox(height: 10,),
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:15),
                    child: Text('You can verify the following documents mentioned below',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.teal[700]
                    ),
                    softWrap: true,
                    ),
                  ),
                  // SizedBox(height: 15,),
                  Flexible(
                    child: Column(
                      children: [
                        Row(
                    
                          children: [
                            Image.asset('assets/images/scan.png',
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right:15.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.donut_large_outlined,
                                          color: Colors.teal[600],
                                          size: 15,
                                        ),
                                        SizedBox(width: 10,),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Column(

                                            children: [
                                              Text('BMET registration card',
                                                softWrap: true,
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(right:15.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.donut_large_outlined,
                                          color: Colors.teal[600],
                                          size: 15,
                                        ),
                                        SizedBox(width: 10,),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Column(
                                            children: [
                                              Text('PDO certificate',
                                                softWrap: true,
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(right:15.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.donut_large_outlined,
                                          color: Colors.teal[600],
                                          size: 15,
                                        ),
                                        SizedBox(width: 10,),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Column(
                                            children: [
                                              Text('Housekeeping Certificate',
                                                style: TextStyle(fontSize: 15),
                                                softWrap: true,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(right:15.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.donut_large_outlined,
                                          color: Colors.teal[600],
                                          size: 15,
                                        ),
                                        SizedBox(width: 10,),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Column(
                                            children: [
                                              Text('General training certificate',
                                                style: TextStyle(fontSize: 15),
                                                softWrap: true,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(right:15.0),
                                    child: Row(

                                      children: [
                                        Icon(
                                          Icons.donut_large_outlined,
                                          color: Colors.teal[600],
                                          size: 15,
                                        ),
                                        SizedBox(width: 15),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Column(

                                            children: [
                                              Text('BMET smart clearance card',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                                softWrap: true,

                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Tap on the Verify Documents button to start scanning',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(

                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)

                      )
                    ),

                    onPressed: (){
                      //open camera for QR scanner
                    }
                  ,
                  child:Text('Verify Documents',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[100],
                  ),
                  ) ,
                  ),
                ),
              ),
          ],
        ),
      )
      );
  }
}
