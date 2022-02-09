import 'package:flutter/cupertino.dart';
import 'package:opulence/constant/FirebaseReferances.dart';
import '../models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _userList = [];

  List<Transaction> get getUserList {
    return [..._userList];
  }

  void addNewTransaction(
      String title, String id, double amount, String category, DateTime date) {
    final temp = new Transaction(
        amount: amount, category: category, date: date, id: id, title: title);
    _userList.add(temp);

    final key = transactionReferance.push().key;
    transactionReferance.child(key).update({
      "amount": amount.toString(),
      "category": category,
      "date": date.toIso8601String(),
      "title": title,
      "id": key
    });
    notifyListeners();
  }

  Future<void> fetchAllData() async {
    final val = await transactionReferance.once();
    if (val.exists) {
      _userList = [];
      final mapped = val.value as Map;
      if (mapped != null) {
        mapped.forEach((key, value) {
          _userList.add(Transaction(
            amount: double.parse(value['amount']),
            category: value['category'],
            date: DateTime.parse(value['date']),
            id: key,
            title: value['title'],
          ));
        });
      }
    }
    notifyListeners();
  }
}
