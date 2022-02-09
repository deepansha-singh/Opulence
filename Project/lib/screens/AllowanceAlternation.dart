import 'package:flutter/material.dart';

class AllowanceAlternation extends StatefulWidget {
  const AllowanceAlternation({Key? key}) : super(key: key);

  @override
  _AllowanceAlternationState createState() => _AllowanceAlternationState();
}

class _AllowanceAlternationState extends State<AllowanceAlternation> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  alignment: Alignment.topLeft,
                  height: constraints.maxHeight * 0.23,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/opulence-png.png',
                        height: constraints.maxHeight * 0.2,
                        width: constraints.maxWidth * 0.3,
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.02,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: constraints.maxHeight * 0.09,
                          ),
                          Container(
                            height: constraints.maxHeight * 0.05,
                            width: constraints.maxWidth * 0.5,
                            child: Text(
                              'Welcome Back,',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Myriad',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: constraints.maxHeight * 0.05,
                            width: constraints.maxWidth * 0.5,
                            child: Text(
                              'User',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Myriad',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Total Allowance:"),
                      Text(
                        "  ₹ Amount",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("You have spent:"),
                      Text(
                        "  ₹ Amount ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(" for this month"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        primary: Color(0xFF3C2415),
                        padding: EdgeInsets.all(20),
                        elevation: 10,
                        minimumSize: Size(constraints.maxWidth * 0.7,
                            constraints.maxHeight * 0.02),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () async {},
                      child: Text(
                        'Get Detailed Analysis',
                        style: TextStyle(
                          fontFamily: 'Myriad',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFF275),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
