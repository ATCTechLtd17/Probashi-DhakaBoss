import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal[50]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                        ),
                        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                          (states) {
                            if (states.contains(WidgetState.pressed)) {
                              return Colors.teal[300];
                            }
                            return Colors.teal[400];
                          },
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        print('English selected');
                      },
                      child: Text(
                        'Eng',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                        ),
                        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                          (states) {
                            if (states.contains(WidgetState.pressed)) {
                              return Colors.teal[300];
                            }
                            return Colors.grey[400];
                          },
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15), // Rounded corners
                          ),
                        ),
                      ),
                      onPressed: () {
                        print('Bangla selected');
                      },
                      child: Text(
                        'বাং',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
                
             Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Icon(Icons.account_circle_outlined,
                  size: 60,
                  ),
                  Text('User name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700]
                  ),
                  ),
      
                ],
              ),
             ),
             Icon(Icons.edit,
             size: 20,
             fill: 200,
             )
            ],
          ),
          SizedBox(height: 50,),
          
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(top:10),
            decoration: BoxDecoration(
              color: Colors.teal[100],
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                Icon(Icons.file_open_outlined,
                size: 30,
                ),
                Column(
                  children: [
                    Text('My Documents',
                    textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),
                ),
                    Text('Scan and store your documents',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.w400
                ),
                ),
      
                  ],
                )
                
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(top:10),
            child: Row(
              children: [
                Icon(Icons.developer_board_outlined,
                size: 30,
                ),
                Column(
                  children: [
                    Text('My Certificates',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),
                ),
                    Text('View and download your certificates',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.w400
                ),
                ),
      
                  ],
                )
                
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(top:10),
            child: Row(
              children: [
                Icon(Icons.settings_outlined,
                size: 30,
                ),
                Column(
                  children: [
                    Text('Settings',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),
                ),
                    Text('Settings and terms of service',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.w400
                ),
                ),
      
                  ],
                )
                
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(top:10),
            child: Row(
              children: [
                Icon(Icons.call_outlined,
                size: 30,
                ),
                Column(
                  children: [
                    Text('Emergency contact details',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),
                ),
                    Text('Find contacts in case of emergency',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.w400
                ),
                ),
      
                  ],
                )
                
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.logout_outlined,
                  size: 30,
                ),
                Column(
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Logout from your account',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}