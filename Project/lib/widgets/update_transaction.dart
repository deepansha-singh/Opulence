// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:opulence/widgets/manual_transaction.dart';
import 'package:flutter/material.dart';

class UpdateTransaction extends StatelessWidget {
  const UpdateTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.yellow,
              size: 40,
            ),
            elevation: 10,
            onPressed: () {},
            backgroundColor: Color(0XFF3C2415),
            mini: false,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color(0XFFD0CD94),
                unselectedItemColor: Color(0XFFD0CD94),
                selectedFontSize: 13,
                unselectedFontSize: 13,
                iconSize: 30,
                backgroundColor: Color(0XFF7C3626).withOpacity(0.7),
                selectedIconTheme: IconThemeData(
                  color: Color(0XFFD0CD94),
                ),
                unselectedIconTheme: IconThemeData(
                  color: Color(0XFFD0CD94),
                ),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.folder),
                    label: 'Saved',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    label: 'Categories',
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            ],
          ),
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
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
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
                        children: <Widget>[
                          SizedBox(
                            height: constraints.maxHeight * 0.09,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.09,
                            width: constraints.maxWidth * 0.55,
                            child: Text(
                              'Transaction Id',
                              textAlign: TextAlign.left,
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
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 0.0),
                      child: Icon(
                        Icons.add_task,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Transaction Title',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Myriad',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 0.0),
                      child: Icon(
                        Icons.add_task,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Amount',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Myriad',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 0.0),
                      child: Icon(
                        Icons.category,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Category',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Myriad',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 0.0),
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Date',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Myriad',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
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
                        minimumSize: Size(constraints.maxWidth * 0.7,
                            constraints.maxHeight * 0.02),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManualTransaction()),
                        );
                      },
                      child: Text(
                        'Upadate',
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
          ),
        );
      },
    );
  }
}
