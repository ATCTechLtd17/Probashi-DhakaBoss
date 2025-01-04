import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:probashi/models/signinprovider.dart';
import 'package:provider/provider.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<Signinprovider>(context);
    return Scaffold(
        backgroundColor: Colors.teal[400],
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          title: Container(
            height: 150,
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),

                //Translate Button
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
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color?>(
                            (states) {
                              if (states.contains(WidgetState.pressed)) {
                                return Colors.teal[300];
                              }
                              return Colors.teal[400];
                            },
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
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
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color?>(
                            (states) {
                              if (states.contains(WidgetState.pressed)) {
                                return Colors.teal[300];
                              }
                              return Colors.grey[400];
                            },
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
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
              ],
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.only(top: 100, left: 30, right: 30),
          decoration: BoxDecoration(
              color: Colors.teal[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Column(
            children: [
              Text(
                'Probashi',
                style: TextStyle(
                    color: Colors.teal[700],
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'DhakaBoss',
                style: TextStyle(
                    color: Colors.teal[500],
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Form(
                  child: signInProvider.isPhoneStage
                      ? _buildPhoneStage(context, signInProvider)
                      : _buildPasswordStage(context, signInProvider),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Divider(
                            height: 2,
                          ),
                          SizedBox(width: 10),
                          Text('Or continue with'),
                          SizedBox(width: 10),
                          Divider(
                            height: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.email_outlined),
                              SizedBox(width: 8),
                              Text('Email'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.web_outlined),
                              SizedBox(width: 8),
                              Text('Google'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook_outlined),
                              SizedBox(width: 8),
                              Text('Facebook'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.call_outlined),
                              SizedBox(width: 8),
                              Text('WhatsApp'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
        // SignForm(),
        );
  }
}

//build stages
Widget _buildPhoneStage(BuildContext context, Signinprovider provider) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enter your Phone Number'),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: DropdownButtonFormField<String>(
                value: provider.countryCode,
                decoration: InputDecoration(
                  focusColor: Colors.teal[200],
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal[400]!,
                    ),
                  ),
                  fillColor: Colors.grey[200],
                ),
                items: ['+1', '+44', '+91', '+880', '+61', '+86'].map((code) {
                  return DropdownMenuItem<String>(
                    value: code,
                    child: Text(code),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    provider.setCountryCode(newValue);
                  }
                },
                dropdownColor: Colors.teal[200],
                menuMaxHeight: 200,
                isExpanded: false,
                icon: Icon(Icons.arrow_drop_down, color: Colors.teal[200]),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 4,
              child: TextFormField(
                decoration: InputDecoration(
                  focusColor: Colors.grey[200],
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal[400]!,
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
                onChanged: provider.setPhoneNumber,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Checkbox(
              value: provider.isAgreed,
              onChanged: (val) {
                provider.setAgreed(val ?? false);
              },
              activeColor: Colors.teal[400],
            ),
            Flexible(
              child: Text(
                'By clicking the box you are agreed with our terms and conditions regarding to your information',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor: WidgetStateProperty.all(
                  provider.isAgreed  ? Colors.teal[400] : Colors.grey[400]),
              padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
            onPressed: () {
              if (provider.phoneNumber.isNotEmpty && provider.isAgreed) {
                provider.nextStage();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(provider.isAgreed
                          ? 'Phone Number is empty'
                          : 'You need to check the box to continue')),
                );
              }
            },
            child: Text(
              'Continue',
              style: TextStyle(
                color: Colors.grey[100],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPasswordStage(BuildContext context, Signinprovider provider) {
  return Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Enter your password'),
      SizedBox(
        height: 20,
      ),
      TextFormField(
        showCursor: false,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          focusColor: Colors.grey[200],
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal[400]!,
            ),
          ),
        ),
        obscureText: true,
        onChanged: provider.setPasssword,
      ),
      SizedBox(
        height: 20,
      ),
      ElevatedButton(
        
        style: ButtonStyle(
          alignment: Alignment.bottomRight
        ),
        onPressed: () {
          if (provider.password.isNotEmpty) {
            context.go('/home');
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Succesful')));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('provide valid')));
          }
        },
        child: Text('Login',
        style: TextStyle(color: Colors.teal[400],
        fontSize: 15,
        fontWeight: FontWeight.w600
        ),
        ),
      )
    ],
  );
}
