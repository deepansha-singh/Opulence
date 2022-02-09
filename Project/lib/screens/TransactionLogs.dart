import 'package:flutter/material.dart';
import 'package:opulence/screens/SummaryScreen.dart';

class TransactionLogs extends StatefulWidget {
  const TransactionLogs({Key? key}) : super(key: key);

  @override
  _TransactionLogsState createState() => _TransactionLogsState();
}

class _TransactionLogsState extends State<TransactionLogs> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Scaffold(
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
                            'Transaction',
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
                            'Logs',
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
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => Padding(
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
                          title: Text("Transacgion ID"),
                          subtitle: Text("₹ amount"),
                          trailing: Text("Date"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "view more...  ",
                  ),
                ],
              ),
              SizedBox(
                height: 30,
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SummaryScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Generate summary',
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
        );
      },
    );
  }
}
