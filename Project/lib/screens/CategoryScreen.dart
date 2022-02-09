import 'package:flutter/material.dart';
import 'package:opulence/screens/CategoryAdd.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoryAnalaysis extends StatefulWidget {
  const CategoryAnalaysis({Key? key}) : super(key: key);

  @override
  _CategoryAnalaysisState createState() => _CategoryAnalaysisState();
}

class _CategoryAnalaysisState extends State<CategoryAnalaysis> {
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
                              'Category',
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
                              'Analaysis',
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
                      Text("Spent most on "),
                      Text(
                        "Category ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.yellowAccent.shade700),
                      ),
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
                      Text("Category Allowance:"),
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
                //...
                PieChart(
                  dataMap: dataMap,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Your expense analysis: "),
                ),
                Container(
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <LineSeries<SalesData, String>>[
                      LineSeries<SalesData, String>(
                          dataSource: <SalesData>[
                            SalesData('Jan', 35),
                            SalesData('Feb', 28),
                            SalesData('Mar', 34),
                            SalesData('Apr', 32),
                            SalesData('May', 40)
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales)
                    ])),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
                ),
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
                ExpansionTile(
                  leading: CircleAvatar(
                    radius: 15,
                  ),
                  title: Text("Category 1"),
                  trailing: Text(
                    "₹ Amount ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <LineSeries<SalesData, String>>[
                          LineSeries<SalesData, String>(
                              dataSource: <SalesData>[
                                SalesData('Jan', 35),
                                SalesData('Feb', 28),
                                SalesData('Mar', 34),
                                SalesData('Apr', 32),
                                SalesData('May', 40)
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales)
                        ])
                  ],
                ),
                ExpansionTile(
                  leading: CircleAvatar(
                    radius: 15,
                  ),
                  title: Text("Category 2"),
                  trailing: Text(
                    "₹ Amount ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <LineSeries<SalesData, String>>[
                          LineSeries<SalesData, String>(
                              dataSource: <SalesData>[
                                SalesData('Jan', 35),
                                SalesData('Feb', 28),
                                SalesData('Mar', 34),
                                SalesData('Apr', 32),
                                SalesData('May', 40)
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales)
                        ])
                  ],
                ),
                ExpansionTile(
                  leading: CircleAvatar(
                    radius: 15,
                  ),
                  title: Text("Category 3"),
                  trailing: Text(
                    "₹ Amount ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <LineSeries<SalesData, String>>[
                          LineSeries<SalesData, String>(
                              dataSource: <SalesData>[
                                SalesData('Jan', 35),
                                SalesData('Feb', 28),
                                SalesData('Mar', 34),
                                SalesData('Apr', 32),
                                SalesData('May', 40)
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales)
                        ])
                  ],
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
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryAdd(),),);
                      },
                      child: Text(
                        'Add category',
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
                  height: 20,
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
                        'Customise category',
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

  Map<String, double> dataMap = {
    "Flutter": 5,
    "Ionic": 2,
  };
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
