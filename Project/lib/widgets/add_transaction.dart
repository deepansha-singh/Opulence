import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:opulence/constant/bottomnavy.dart';
import 'package:opulence/screens/CategoryScreen.dart';
import 'package:opulence/screens/Search.dart';
import 'package:opulence/screens/TransactionLogs.dart';
import 'package:opulence/widgets/CameraView.dart';

import 'loginpage.dart';
import 'manual_transaction.dart';

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  int currentIndex = 0;
  bool isfloationactionselected = false;
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
              onPressed: () {
                setState(() {
                  isfloationactionselected = !isfloationactionselected;
                });
              },
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
                  selectedItemColor: Colors.yellow,
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
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                      isfloationactionselected = false;
                    });
                  },
                  currentIndex: currentIndex,
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
                    MaterialPageRoute(builder: (context) => LoginPage()),
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
                PopupMenuButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ), //don't specify icon if you want 3 dot menu
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                      value: 0,
                      child: ListTile(
                        leading: Icon(Icons.monetization_on_sharp),
                        title: Text(
                          "Allowance Alteration",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: ListTile(
                        leading: Icon(Icons.book),
                        title: Text(
                          "Recipt Catalogue",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  PopupMenuItem<int>(
                      value: 2,
                      child: ListTile(
                        leading: Icon(Icons.account_circle_outlined),
                        title: Text(
                          "Manage account",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  PopupMenuItem<int>(
                      value: 3,
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text(
                          "Settings",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],


                  onSelected: (item) => {print(item)},
                ),
              ],
            ),
            body: isfloationactionselected
                ? SingleChildScrollView(
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
                                children: <Widget>[
                                  SizedBox(
                                    height: constraints.maxHeight * 0.09,
                                  ),
                                  Container(
                                    height: constraints.maxHeight * 0.05,
                                    width: constraints.maxWidth * 0.5,
                                    child: Text(
                                      'Add Transaction',
                                      textAlign: TextAlign.center,
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
                                height: constraints.maxHeight * 0.45,
                                width: constraints.maxWidth * 0.9,
                                decoration: BoxDecoration(
                                    color: Color(0XFFD0CD94).withOpacity(0.45),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0))),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.fromLTRB(
                                          0.0, 20.0, 20.0, 0.0),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.cancel_outlined,
                                          color: Color(0XFF3C2415),
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.07,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        alignment: Alignment.center,
                                        primary: Color(0xFF3C2415),
                                        padding: EdgeInsets.all(20),
                                        elevation: 10,
                                        minimumSize: Size(
                                            constraints.maxWidth * 0.7,
                                            constraints.maxHeight * 0.02),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      onPressed: () async {
                                        final cameras =
                                            await availableCameras();
                                        final firstCamera = cameras.first;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TakePictureScreen(
                                                    camera: firstCamera,
                                                  )),
                                        );
                                      },
                                      child: Text(
                                        'Scan Receipt',
                                        style: TextStyle(
                                          fontFamily: 'Myriad',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFFF275),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.03,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        alignment: Alignment.center,
                                        primary: Color(0XFFD0CD94),
                                        padding: EdgeInsets.all(20),
                                        elevation: 10,
                                        minimumSize: Size(
                                            constraints.maxWidth * 0.7,
                                            constraints.maxHeight * 0.02),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ManualTransaction()),
                                        );
                                      },
                                      child: Text(
                                        'Enter Manually',
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.1,
                        ),
                      ],
                    ),
                  )
                : currentIndex == 0
                    ? bottomlist[currentIndex]
                    : currentIndex == 1
                        ? SearchTransaction()
                        : currentIndex == 2
                            ? TransactionLogs()
                            : currentIndex == 3
                                ? CategoryAnalaysis()
                                : Container());
      },
    );
  }
}
