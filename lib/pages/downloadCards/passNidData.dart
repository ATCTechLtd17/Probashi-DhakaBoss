import 'package:flutter/material.dart';

class PassNidData extends StatelessWidget {
  const PassNidData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
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
                    padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
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
          ),]
          ),

          ),);
  }
}