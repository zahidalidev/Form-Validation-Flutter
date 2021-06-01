import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String username = '';
  String email = '';
  String mobileNumber = '';
  String password = '';
  String warnMessage = '';
  bool termsConditions = false;

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 40, left: 10),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamed(context, 'videoForm');
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, left: 30),
              child: Column(
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, bottom: 20, left: 30),
              child: Column(
                children: [
                  Text(
                    "Sign up to experience new ways",
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Form(
              key: key,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    height: 65,
                    child: ListTile(
                      title: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            username = value.toString();
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter User Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          labelStyle: TextStyle(fontSize: 18),
                          prefixIcon: Icon(
                            Icons.person_outline,
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    height: 65,
                    child: ListTile(
                      title: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            email = value.toString();
                          });
                        },
                        validator: (value) {
                          RegExp regExp = new RegExp(
                              r'^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$');

                          if (!regExp.hasMatch(value.toString())) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email Id',
                          labelStyle: TextStyle(fontSize: 18),
                          prefixIcon: Icon(Icons.alternate_email),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    height: 65,
                    child: ListTile(
                      title: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            mobileNumber = value.toString();
                          });
                        },
                        validator: (value) {
                          int len = value.toString().length;
                          if (len > 11 || len < 11) {
                            return 'Mobile Number is not valid';
                          } else {
                            RegExp regExp = new RegExp(r'(\d{11})');
                            if (!regExp.hasMatch(value.toString())) {
                              return 'Only numbers are allowed';
                            }
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Mobile No',
                          labelStyle: TextStyle(fontSize: 18),
                          prefixIcon: Icon(Icons.call_outlined),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    height: 65,
                    child: ListTile(
                      title: TextFormField(
                        obscureText: true,
                        onSaved: (value) {
                          setState(() {
                            password = value.toString();
                          });
                        },
                        validator: (value) {
                          int len = value.toString().length;
                          if (len < 5) {
                            return 'Password length must be greater than 5.';
                          } else {
                            RegExp regExp = new RegExp(r'^[a-zA-Z0-9]+$');

                            if (!regExp.hasMatch(value.toString())) {
                              return 'Password must only contain alphabets and numbers';
                            }
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 18),
                          prefixIcon: Icon(Icons.lock_outlined),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    height: 65,
                    child: ListTile(
                      title: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              'Register',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              )),
                          onPressed: () {
                            if (!termsConditions) {
                              setState(() {
                                warnMessage =
                                    'Please accept the Terms & Conditions';
                              });
                            } else {
                              if (key.currentState!.validate()) {
                                key.currentState!.save();
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 65,
                    child: ListTile(
                      title: Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: termsConditions,
                            onChanged: (bool? value) {
                              setState(() {
                                warnMessage = '';
                                termsConditions = value!;
                              });
                            },
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'I accept the ',
                              style: TextStyle(color: Colors.grey),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    warnMessage != '' ? '*$warnMessage' : '',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
