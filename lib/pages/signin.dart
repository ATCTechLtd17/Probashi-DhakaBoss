import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Welcome'),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.teal[400],
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Eng',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[800],
                        ),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'বাং',
                        style: TextStyle(fontSize: 10, color: Colors.grey[800]),
                      )),
                ),
              ],
            ),
                     
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            
          )
        ),
        child: Column(
          children: [
           Text('Probashi',
           style: TextStyle(color: Colors.teal[700],
           fontSize: 20,
           fontWeight: FontWeight.w600
           ),
           ),
           Text('DhakaBoss',
           style: TextStyle(color: Colors.teal[500],
           fontSize: 15,
           fontWeight: FontWeight.w400
           ),)
          ],
        ),
      )
      // SignForm(),
    );
  }
}
