import 'package:flutter/material.dart';

class Document extends StatelessWidget {
  const Document({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> cardItems= [
      
      {'title': 'BMET Card'},
      {'title': 'PDO Enrollment Card'},
      {'title': 'PDO Certificate'},
      {'title': 'BMET Smart Card', 'scan': true},
      {'title': 'Visa', 'scan': true},
      {'title': 'Vaccine Certification', 'scan': true},
      {'title': 'National ID Document', 'scan': true},
      {'title': 'Testing Certificate', 'scan': true},
      {'title': 'Experience Certificate', 'scan': true},

    ];
    return Container(
      padding: EdgeInsets.fromLTRB(15, 100, 15, 0),
      decoration: BoxDecoration(
        color: Colors.teal[50]
      ),
      child: Column(
        children: [
          //Title
          Text('My documents',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          ),
          Text('Scan and store all your important documents here',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey[600],
          ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Document Name',
                    hintStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                    border: OutlineInputBorder(

                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[700]!,
                      width: 1),

                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!,
                      width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8,),
              ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )),
                    elevation: WidgetStateProperty.all(2),
                    padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 5, horizontal: 8)),
                    backgroundColor: WidgetStateProperty.all(Colors.teal[600])
                  ),
                  onPressed: (){
                //scan document
              },
              child: Row(
                  children: [
                    Icon(Icons.camera_alt, color: Colors.white, size: 18),
                    SizedBox(width: 8),
                    Text('Scan',
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 10
                    ),
                    )
                  ],

              ),
              ),
            ],),
          ),
          Flexible(
            child:Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(top: 20),


              child: SingleChildScrollView(
                
                
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.loose,
                      children:
                      cardItems.asMap().map(
                              (index, card){
                            return MapEntry(index, Positioned(
                              top: index * 80,
                              left: 10,
                              right: 10,
                              child: Card(
                                elevation: 20,

                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 200,

                                  decoration: BoxDecoration(

                                      color: Colors.teal[100],
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(card['title'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),

                                      if(card['scan']== true)
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10)
                                              )),
                                              elevation: WidgetStateProperty.all(2),
                                              padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 5, horizontal: 8)),
                                              backgroundColor: WidgetStateProperty.all(Colors.teal[600])
                                          ),
                                          onPressed: (){
                                            //scan document
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.camera_alt, color: Colors.white, size: 18),
                                              SizedBox(width: 8),
                                              Text('Scan',
                                                style: TextStyle(
                                                    color: Colors.grey[100],
                                                    fontSize: 10
                                                ),
                                              )
                                            ],

                                          ),
                                        ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            );
                          }
                      ).values.toList(),





                    
                  ),

                

              ),
            ),
          )
        ],
      ),
    );
  }
}