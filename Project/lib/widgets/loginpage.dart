import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'createnew.dart';
import 'add_transaction.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emaillController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return SafeArea(
          child: Scaffold(
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
                          child: FittedBox(
                            child: Text(
                              'Welcome back!',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Myriad',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.9,
                          child: TextFormField(
                            validator: (val) {
                              if (_emaillController.text.isEmpty) {
                                return "enter in field";
                              } else if (!_emaillController.text
                                  .contains("@")) {
                                return "enter correct email";
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontFamily: 'Myriad',
                            ),
                            controller: _emaillController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                              icon: Padding(
                                padding: const EdgeInsets.only(
                                    left: 2.0, right: 0.0),
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
                          child: TextFormField(
                            style: TextStyle(
                              fontFamily: 'Myriad',
                            ),
                            validator: (val) {
                              if (_passwordController.text.isEmpty) {
                                return "enter in field";
                              } else if (_passwordController.text.length <= 8) {
                                return "enter atlease 8 digits";
                              }
                              return null;
                            },
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5.0),
                              icon: Padding(
                                padding: const EdgeInsets.only(
                                    left: 2.0, right: 0.0),
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
                          onPressed: () async {
                            await forgotpassword();
                          },
                          child: FittedBox(
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontFamily: 'Myriad',
                                color: Color(0xFF5E6973),
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.01,
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
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: _emaillController.text.trim(),
                                        password: _passwordController.text);
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
                                  'Login',
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
                              'Don\'t have an account yet?',
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
                                      builder: (context) => CreateNewPage()),
                                );
                              },
                              child: Text(
                                'Join us',
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
          ),
        );
      },
    );
  }

  Future<void> forgotpassword() async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Forgot password!"),
        content: TextField(
          controller: _emaillController,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.sendPasswordResetEmail(
                    email: _emaillController.text.trim());
                Navigator.of(ctx).pop();
                Fluttertoast.showToast(
                    msg: "Reset email sent to your email successfully");
              } catch (e) {
                Fluttertoast.showToast(
                    msg: "something went wrong check your email ID");
                Navigator.of(ctx).pop();
              }
            },
            child: Text("send request"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
            },
            child: Text("cancel"),
          ),
        ],
      ),
    );
  }
}
