import 'package:budget_tracker/global_vars.dart';
import 'package:flutter/material.dart';

//storehouse
class SavingsProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> savings = [
    {
      "id": "1",
      "type": CategoryTypes.savings,
      "title": "Mutual Fund",
      "icons": "",
      "allocated_amount": 5000,
      "transactions": [
        {
          "id": '1',
          "amount": 3000,
          "category": CategoryTypes.savings,
          "date": "3/9/2023",
        },
      ]
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