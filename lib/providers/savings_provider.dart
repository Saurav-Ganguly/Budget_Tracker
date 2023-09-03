import 'package:budget_tracker/global_vars.dart';
import 'package:flutter/material.dart';

//storehouse
class SavingsProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> savings = [
    {
      "id": "1",
      "type": CategoryTypes.savings,
      "title": "Fixed Deposit",
      "icons": "",
      "allocated_amount": 1500,
    },
    {
      "id": "5",
      "type": CategoryTypes.savings,
      "title": "Mutual Funds",
      "icons": "",
      "allocated_amount": 5000,
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

// {
//   "id" : "....."
//   "type" : "expenses / savings / goals",
//   "title" : "rent",
//   "icons" : ".......",
//   "allocated_amount" : 8500,
//   "monthly_transactions" : [
//     {
//       "id" : 'id',
//       "amount" : 8500,
//       "category" : {category_id},
//       "date" : "date",
//     }
//   ] 
// }