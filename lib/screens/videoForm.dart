import 'package:assignment7/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';

class VideoForm extends StatefulWidget {
  @override
  _VideoFormState createState() => _VideoFormState();
}

class _VideoFormState extends State<VideoForm> {
  String to = '';
  String subject = '';
  String body = '';
  String message = '';

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: key,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 40),
                      height: 65,
                      child: ListTile(
                        title: TextFormField(
                          onSaved: (value) {
                            setState(() {
                              to = value.toString();
                            });
                          },
                          validator: (value) {
                            RegExp regExp = new RegExp(
                                r'^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$');

                            if (!regExp.hasMatch(value.toString())) {
                              return 'Please enter a valid subject address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'TO',
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.black),
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
                              subject = value.toString();
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Subject';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'SUBJECT',
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      height: 65,
                      child: ListTile(
                        title: TextFormField(
                          maxLines: 9,
                          onSaved: (value) {
                            setState(() {
                              body = value.toString();
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'BODY',
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.black),
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
                                  'SEND',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey[300],
                                elevation: 5,
                              ),
                              onPressed: () {
                                if (key.currentState!.validate()) {
                                  key.currentState!.save();
                                  setState(() {
                                    message = "Email send";
                                  });
                                } else {
                                  setState(() {
                                    message = "";
                                  });
                                }
                              }),
                        ),
                      ),
                    ),
                    Text(
                      message != '' ? '$message' : '',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
