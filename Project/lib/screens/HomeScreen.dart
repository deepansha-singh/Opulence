import 'package:flutter/material.dart';
import 'package:opulence/constant/FirebaseReferances.dart';
import 'package:opulence/models/transaction.dart';
import 'package:opulence/provider/transactionProvider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Transaction> _userList = [];
  double totalAmount = 1000.0;
  var totalAmountMonth = 0.0;
  void getData() async {
    final ref = Provider.of<TransactionProvider>(context, listen: false);
    await ref.fetchAllData();
    _userList =
        Provider.of<TransactionProvider>(context, listen: false).getUserList;
    setState(() {
      _userList.forEach((element) {
        print(_userList.length);

        if (element.date.month == DateTime.now().month) {
          totalAmountMonth += element.amount;
        }
      });
    });
  }

  List<String> category = [];
  List<String> categoryColors = [];

  void fetchData() async {
    final resource = await categoryReference.once();
    if (resource.exists) {
      final body = resource.value as Map;
      if (body != null) {
        body.forEach((key, value) {
          category.add(value['title'] as String);
          categoryColors.add(value['ColorCode'] as String);

          print(category);
        });
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    getData();
    fetchData();
    super.initState();
  }

  double eachCateData(String name) {
    var returningValue = 0.0;
    _userList.forEach((element) {
      if (element.category.contains(name)) {
        returningValue += element.amount;
      }
    });
    return returningValue;
  }

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
                        "  ₹ $totalAmount",
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
                        "  ₹ $totalAmountMonth ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(" for this month"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //...
                PieChart(
                  dataMap: {
                    "Total": totalAmount,
                    "Monthwise": totalAmountMonth,
                  },
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: 32,
                  chartRadius: MediaQuery.of(context).size.width / 2.5,
                  colorList: [Colors.grey, Colors.black],
                  initialAngleInDegree: 0,
                  chartType: ChartType.disc,
                  ringStrokeWidth: 32,
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    showLegends: false,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: true,
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: false,
                    decimalPlaces: 1,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //..
                Container(
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <LineSeries<SalesData, String>>[
                      LineSeries<SalesData, String>(
                          dataSource: <SalesData>[
                            SalesData('Jan', 0),
                            SalesData('Feb', 0),
                            SalesData('Mar', 0),
                            SalesData('Apr', 0),
                            SalesData('Jun', 0),
                            SalesData('Jul', 0),
                            SalesData('Aug', 0),
                            SalesData('Sept', 0),
                            SalesData('Oct', 0),
                            SalesData('Nov', 0),
                            SalesData('Dec', totalAmountMonth),
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales)
                    ])),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Category-wise analysis:",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: category.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(int.parse(categoryColors[index])),
                    ),
                    title: Text("Category 1"),
                    trailing: Text(
                      "₹ ${eachCateData(category[index])} ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
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

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
