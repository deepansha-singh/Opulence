import 'package:flutter/material.dart';
import 'package:opulence/models/transaction.dart';
import 'package:opulence/provider/transactionProvider.dart';
import 'package:provider/provider.dart';

class SearchTransaction extends StatefulWidget {
  const SearchTransaction({Key? key}) : super(key: key);

  @override
  _SearchTransactionState createState() => _SearchTransactionState();
}

class _SearchTransactionState extends State<SearchTransaction> {
  List<Transaction> _userList = [];
  double totalAmount = 1000.0;
  var totalAmountMonth = 0.0;
  void getData() async {
    final ref = Provider.of<TransactionProvider>(context, listen: false);
    await ref.fetchAllData();
    _userList =
        Provider.of<TransactionProvider>(context, listen: false).getUserList;
    _finalFilterList = _userList;
    setState(() {
      _userList.forEach((element) {
        if (element.date.month == DateTime.now().month) {
          totalAmountMonth += element.amount;
        }
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                              'Found what you,',
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
                              'were looking for?',
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
                searchWidget(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.48,
                  child: ListView.builder(
                    itemCount: _finalFilterList.length,
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
                            title: Text("${_finalFilterList[index].title}"),
                            subtitle:
                                Text("₹ ${_finalFilterList[index].amount}"),
                            trailing: Text(
                                "${_finalFilterList[index].date.day}/${_finalFilterList[index].date.month}/${_finalFilterList[index].date.year}"),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  TextEditingController _searchCtrl = new TextEditingController();
  List<Transaction> _filteredList = [];
  List<Transaction> _finalFilterList = [];
  List<Transaction> get copyList {
    return [..._userList];
  }

  void searchAlgo() {
    _filteredList = [];
    copyList.forEach((element) {
      if (element.title.toLowerCase().contains(
            query!.toLowerCase(),
          )) {
        _filteredList.add(element);
      }
    });
  }

  String? query;
  Widget searchWidget() {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Container(
            height: 60,
            child: TextFormField(
              onChanged: (val) {
                setState(
                  () {
                    query = val;
                    if (query != null) {
                      searchAlgo();
                      _finalFilterList = _filteredList;
                    }
                    if (query!.length == 0) {
                      query = null;
                      _filteredList = [];
                      _finalFilterList = [..._userList];
                    }
                  },
                );
              },
              controller: _searchCtrl,
              cursorColor: Colors.yellowAccent,
              decoration: InputDecoration(
                hintText: "Search Transaction",
                border: InputBorder.none,
                prefix: IconButton(
                  onPressed: () {
                    setState(() {
                      query = null;
                      _searchCtrl.text = "";
                      _filteredList = [];
                      _finalFilterList = copyList;
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    });
                  },
                  icon: Icon(
                    Icons.clear,
                    size: 18,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    // navigate with filtered List;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SafeArea(
                          child: Scaffold(
                            appBar: AppBar(
                              title:
                                  Text("${_filteredList.length} Result Found"),
                            ),
                            body: _filteredList.isEmpty
                                ? Center(
                                    child: Text("No Result Found"),
                                  )
                                : ListView.builder(
                                    itemCount: _filteredList.length,
                                    itemBuilder: (context, index) => ListTile(
                                      onTap: () {},
                                      title:
                                          Text("${_filteredList[index].title}"),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
