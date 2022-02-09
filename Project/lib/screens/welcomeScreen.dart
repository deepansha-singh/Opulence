import 'package:flutter/material.dart';
import 'package:opulence/widgets/createnew.dart';
import 'package:opulence/widgets/loginpage.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: constraints.maxHeight * 0.1,
            ),
            Container(
              alignment: Alignment.center,
              height: constraints.maxHeight * 0.57,
              child: Column(
                children: [
                 
                 Image.asset(
                      'assets/images/opulence-png.png',
                      height: constraints.maxHeight * 0.3,
                      width: constraints.maxWidth * 0.7,
                    ),
                  
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.07,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        'This is your expence journey.',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Myriad',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.03,
                  ),
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.07,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        '''Tired of keeping logs and random receipts?\nLet us help you!''',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Myriad',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                primary: Color(0xFF3C2415),
                padding: EdgeInsets.all(20),
                elevation: 10,
                minimumSize: Size(
                    constraints.maxWidth * 0.9, constraints.maxHeight * 0.02),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: FittedBox(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Myriad',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFF275),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.03,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                primary: Color(0xFFD0CD94),
                padding: EdgeInsets.all(20),
                elevation: 10,
                minimumSize: Size(
                    constraints.maxWidth * 0.9, constraints.maxHeight * 0.02),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateNewPage()),
                );
              },
              child: FittedBox(
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    fontFamily: 'Myriad',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}