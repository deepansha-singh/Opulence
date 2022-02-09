// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

import 'update_transaction.dart';

class DetailsSaved extends StatelessWidget {
  const DetailsSaved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: <Widget>[
              SizedBox(
                height: constraints.maxHeight * 0.35,
              ),
              Container(
                alignment: Alignment.center,
                height: constraints.maxHeight * 0.3,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/opulence-png.png',
                      height: constraints.maxHeight * 0.15,
                      width: constraints.maxWidth * 0.4,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.07,
                      alignment: Alignment.center,
                      // ignore: prefer_const_constructors
                      child: FittedBox(
                        child: Text(
                          'Details Saved!',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Myriad',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      primary: Color(0XFFD0CD94),
                      padding: EdgeInsets.all(20),
                      elevation: 10,
                      minimumSize: Size(constraints.maxWidth * 0.9,
                          constraints.maxHeight * 0.02),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                     Navigator.of(context).pop();
                     Navigator.of(context).pop();
                    },
                    child: Text(
                      'Done!',
                      style: TextStyle(
                        fontFamily: 'Myriad',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3C2415),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
