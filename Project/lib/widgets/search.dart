// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:opulence/widgets/found.dart';
import 'package:flutter/material.dart';

import 'add_transaction.dart';

class SearchTransaction extends StatelessWidget {
  SearchTransaction({Key? key}) : super(key: key);

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
                    icon: Icon(Icons.folder_open),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTransaction()),
                );
              },
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
                              'Missing Something?',
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
                Container(
                  height: constraints.maxHeight * 0.5,
                  width: constraints.maxWidth * 0.9,
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: constraints.maxHeight * 0.06,
                        width: constraints.maxWidth * 0.9,
                        decoration: BoxDecoration(
                            color: Color(0XFFD0CD94).withOpacity(0.45),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                              child: Container(
                                alignment: Alignment.topLeft,
                                margin:
                                    EdgeInsets.fromLTRB(12.0, 15.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.search,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.95,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
                              child: TextField(
                                style: TextStyle(
                                  fontFamily: 'Myriad',
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                 
                                  isDense: true,
                                  helperStyle: TextStyle(
                                    fontFamily: 'Myriad',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFF275),
                                  ),
                                  contentPadding: EdgeInsets.all(5.0),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2.0, right: 0.0),
                                    child: Icon(
                                      Icons.add_task,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                  ),
                                  labelText: 'Amount',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Myriad',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.95,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
                              child: TextField(
                                style: TextStyle(
                                  fontFamily: 'Myriad',
                                ),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                 
                                  isDense: true,
                                  helperStyle: TextStyle(
                                    fontFamily: 'Myriad',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFF275),
                                  ),
                                  contentPadding: EdgeInsets.all(5.0),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2.0, right: 0.0),
                                    child: Icon(
                                      Icons.category,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                  ),
                                  labelText: 'Category',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Myriad',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 0.0),
                              child: TextField(
                                style: TextStyle(
                                  fontFamily: 'Myriad',
                                ),
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  isDense: true,
                                  helperStyle: TextStyle(
                                    fontFamily: 'Myriad',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFF275),
                                  ),
                                  contentPadding: EdgeInsets.all(5.0),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2.0, right: 0.0),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                  ),
                                  labelText: 'Date',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Myriad',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        height: constraints.maxHeight * 0.03,
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.02,
                            ),
                            Text(
                              'Scanned Receipt',
                              style: TextStyle(
                                fontFamily: 'Myriad',
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        height: constraints.maxHeight * 0.03,
                        child: Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.02,
                            ),
                            Text(
                              'Attached Image',
                              style: TextStyle(
                                fontFamily: 'Myriad',
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.1,
                      ),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoundTransaction()),
                          );
                        },
                        child: Text(
                          'Search',
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
