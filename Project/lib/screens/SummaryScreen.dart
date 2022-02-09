import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
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
                            'Your Summary',
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
                            'is ready!',
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
                  ],
                ),
              ),
              Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Card(
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(),
                          title: Text("Month name"),
                          subtitle: Text("₹ amount"),
                          trailing: Text("Download"),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      );
    });
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
