import 'package:budget_tracker/global_vars.dart';
import 'package:flutter/material.dart';

//storehouse
class ExpensesProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> expenses = [
    {
      "id": "1",
      "type": CategoryTypes.expenses,
      "title": "rent",
      "icons": "",
      "allocated_amount": 8500,
      "transactions": [
        {
          "id": '1',
          "amount": 6500,
          "category": CategoryTypes.expenses,
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