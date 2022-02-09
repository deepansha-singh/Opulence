import 'package:fluttertoast/fluttertoast.dart';
import 'package:opulence/constant/FirebaseReferances.dart';
import 'package:flutter/material.dart';
import 'package:opulence/screens/CategoryAdd.dart';
import 'package:opulence/screens/TransactionLogs.dart';
import 'package:provider/provider.dart';

import 'add_transaction.dart';
import 'search.dart';
import 'details_saved.dart';
import '../provider/transactionProvider.dart';

class ManualTransaction extends StatefulWidget {
  @override
  _ManualTransactionState createState() => _ManualTransactionState();
}

class _ManualTransactionState extends State<ManualTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  final categoryController = TextEditingController();

  final dateController = TextEditingController(
      text:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");

  DateTime date = DateTime.now();

  List<String> category = [];

  void fetchData() async {
    final resource = await categoryReference.once();
    if (resource.exists) {
      final body = resource.value as Map;
      if (body != null) {
        body.forEach((key, value) {
          category.add(value['title'] as String);
          print(category);
        });
      }
      setState(() {
        categoryController.text = category.first;
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
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
                          Container(
                            height: constraints.maxHeight * 0.09,
                            width: constraints.maxWidth * 0.55,
                            child: Text(
                              'Transaction Details',
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
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 0.0),
                      child: TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(
                          fontFamily: 'Myriad',
                        ),
                        controller: titleController,
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
                            padding:
                                const EdgeInsets.only(left: 2.0, right: 0.0),
                            child: Icon(
                              Icons.add_task,
                              color: Colors.grey,
                              size: 25,
                            ),
                          ),
                          labelText: 'Transaction Title',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Myriad',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 0.0),
                      child: TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(
                          fontFamily: 'Myriad',
                        ),
                        controller: amountController,
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
                            padding:
                                const EdgeInsets.only(left: 2.0, right: 0.0),
                            child: Icon(
                              Icons.credit_card,
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
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200]),

                          // width: width * .4,
                          // height: height * .05,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              // itemHeight: height * .1,
                              underline: Text(''),
                              isExpanded: true,
                              value: categoryController.text,
                              icon: Icon(Icons.keyboard_arrow_down),
                              hint: Text("Category"),
                              items: category.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      overflow: TextOverflow.ellipsis,
                                    ));
                              }).toList(),
                              onChanged: (String? newValue) {
                                categoryController.text = newValue!;
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 0.0),
                        child: TextField(
                          onTap: () async {
                            final datedetails = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate:
                                    DateTime.now().subtract(Duration(days: 30)),
                                lastDate:
                                    DateTime.now().add(Duration(days: 30)));
                            if (datedetails != null) {
                              date = datedetails;
                            }
                          },
                          controller: dateController,
                          cursorColor: Colors.grey,
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
                              padding:
                                  const EdgeInsets.only(left: 2.0, right: 0.0),
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
                  height: constraints.maxHeight * 0.15,
                  width: constraints.maxWidth * 0.95,
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: constraints.maxHeight * 0.1,
                        width: constraints.maxWidth * 0.9,
                        decoration: BoxDecoration(
                            color: Color(0XFFD0CD94).withOpacity(0.45),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Description',
                                style: TextStyle(
                                  fontFamily: 'Myriad',
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
                  height: constraints.maxHeight * 0.01,
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
                        minimumSize: Size(constraints.maxWidth * 0.9,
                            constraints.maxHeight * 0.02),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        if (titleController.text.isEmpty &&
                            amountController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please enter all the details");
                          return;
                        } else if (categoryController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please create a category");
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Go To!"),
                              content: Text("You want to create new category?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("No"),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TransactionLogs()));
                                    },
                                    child: Text("Yes"))
                              ],
                            ),
                          );
                          return;
                        }
                        Provider.of<TransactionProvider>(context, listen: false)
                            .addNewTransaction(
                          titleController.text,
                          '${DateTime.now()}',
                          double.parse(amountController.text),
                          categoryController.text,
                          date,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsSaved(),
                          ),
                        );
                      },
                      child: Text(
                        'Confirm',
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
              ],
            ),
          ),
        );
      },
    );
  }
}
