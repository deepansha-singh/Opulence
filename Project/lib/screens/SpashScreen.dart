import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opulence/screens/welcomeScreen.dart';
import 'package:opulence/widgets/add_transaction.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    getcurrentUser();
  }

  Future<void> getcurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => WelcomePage(),
          ),
        );
      });
    } else {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AddTransaction(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 40,
              child: Hero(
                tag: "logo",
                child: Image.asset(
                  "assets/images/opulence-png.png",
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
