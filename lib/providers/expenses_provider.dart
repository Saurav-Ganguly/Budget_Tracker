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
    },
    {
      "id": "2",
      "type": CategoryTypes.expenses,
      "title": "grocery",
      "icons": "",
      "allocated_amount": 3000,
    },
    {
      "id": "3",
      "type": CategoryTypes.expenses,
      "title": "self care",
      "icons": "",
      "allocated_amount": 3500,
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