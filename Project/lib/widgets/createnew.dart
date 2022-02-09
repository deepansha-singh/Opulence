// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:opulence/widgets/add_transaction.dart';

import 'loginpage.dart';

class CreateNewPage extends StatefulWidget {
  const CreateNewPage({Key? key}) : super(key: key);

  @override
  _CreateNewPageState createState() => _CreateNewPageState();
}

class _CreateNewPageState extends State<CreateNewPage> {
  TextEditingController _emaillController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _passwordConfirmController =
      new TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Column(
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'assets/images/opulence-png.png',
                          height: constraints.maxHeight * 0.3,
                          width: constraints.maxWidth * 0.7,
                          alignment: Alignment.center,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Container(
                        width: constraints.maxWidth * 0.9,
                        height: constraints.maxHeight * 0.07,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Join Us!',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Myriad',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.9,
                        child: TextField(
                          style: TextStyle(
                            fontFamily: 'Myriad',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: _emaillController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(5),
                            icon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 2.0, right: 0.0),
                              child: Icon(
                                Icons.email,
                                color: Colors.grey,
                                size: 25,
                              ),
                            ),
                            labelText: 'E-mail ID',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Myriad',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.9,
                        child: TextField(
                          style: TextStyle(
                            fontFamily: 'Myriad',
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(5),
                            icon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 2.0, right: 0.0),
                              child: Icon(
                                Icons.password_rounded,
                                color: Colors.grey,
                                size: 25,
                              ),
                            ),
                            labelText: 'Password ID',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Myriad',
                            ),
                          ),
                          controller: _passwordController,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.01,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.9,
                        child: TextField(
                          controller: _passwordConfirmController,
                          style: TextStyle(
                            fontFamily: 'Myriad',
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(5),
                            icon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 2.0, right: 0.0),
                              child: Icon(
                                Icons.password_rounded,
                                color: Colors.grey,
                                size: 25,
                              ),
                            ),
                            labelText: 'Password ID',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Myriad',
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Terms and Conditions',
                          style: TextStyle(
                            fontFamily: 'Myriad',
                            color: Color(0xFF5E6973),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          primary: Color(0xFF3C2415),
                          padding: EdgeInsets.all(20),
                          elevation: 10,
                          minimumSize: Size(constraints.maxWidth * 0.9,
                              constraints.maxHeight * 0.02),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              setState(() {
                                _isLoading = true;
                              });
                             final data =  await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _emaillController.text.trim(),
                                      password: _passwordController.text);
                              await FirebaseDatabase.instance.reference().child("User information").child(data.user!.uid).update({
                                "email" : _emaillController.text,
                                "created on" : DateTime.now().toIso8601String(),
                              });
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddTransaction()),
                              );
                            } catch (e) {
                              Fluttertoast.showToast(
                                  msg:
                                      "something went wrong please check your email id and password");
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }
                        },
                        child: _isLoading
                            ? SpinKitThreeBounce(
                                size: 25,
                                color: Colors.white,
                              )
                            : Text(
                                'Create new account',
                                style: TextStyle(
                                  fontFamily: 'Myriad',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFF275),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontFamily: 'Myriad',
                              color: Color(0xFF5E6973),
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'Myriad',
                                color: Color(0xFF5E6973),
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
