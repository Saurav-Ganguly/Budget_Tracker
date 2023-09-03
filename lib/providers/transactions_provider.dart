import 'package:flutter/material.dart';
import 'package:budget_tracker/global_vars.dart';

//storehouse
class TransactionsProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> transactions = [
    {
      "id": '1',
      "amount": 6500,
      "category": "1",
      "date": "3/9/2023",
    },
    {
      "id": '2',
      "amount": 5500,
      "category": CategoryTypes.goals,
      "date": "3/9/2023",
    },
    {
      "id": '3',
      "amount": 500,
      "category": CategoryTypes.savings,
      "date": "3/9/2023",
    },
  ];

  // void addProduct(Map<String, dynamic> product) {
  //   cart.add(product);
  //   notifyListeners();
  // }

  // void removeProduct(Map<String, dynamic> product) {
  //   cart.remove(product);
  //   notifyListeners();
  // }
}










//     {
//       "id" : 'id',
//       "amount" : 8500,
//       "category" : {category_id},
//       "date" : "date",
//     }