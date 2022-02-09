// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'manual_transaction.dart';
import '../models/transaction.dart';
import '../provider/transactionProvider.dart';

class TransactionList extends StatefulWidget {
  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  List<Transaction> _usertransactions = [
    Transaction(
      id: 't1',
      title: 'Books',
      category: 'a',
      amount: 40.33,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Pens',
      category: 'b',
      amount: 4.33,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'BookMarks',
      category: 'c',
      amount: 10.33,
      date: DateTime.now(),
    ),
  ];

  @override
  void didChangeDependencies() {
    _usertransactions = Provider.of<TransactionProvider>(context).getUserList;
    setState(() {});
    super.didChangeDependencies();
  }

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
                  MaterialPageRoute(builder: (context) => ManualTransaction()),
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
                              'Transaction Log',
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
                Column(
                  children: _usertransactions.map((tx) {
                    return Container(
                      height: constraints.maxHeight * 0.095,
                      child: Card(
                        margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                        color: Color(0XFFD0CD94).withOpacity(0.45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 18,
                              ),
                              child: Text(
                                'Rs ${tx.amount}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Myriad',
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: constraints.maxHeight * 0.01),
                                Text(
                                  tx.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Myriad',
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMd().format(tx.date),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Myriad',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.06,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
