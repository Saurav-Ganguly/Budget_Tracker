import 'package:budget_tracker/global_vars.dart';
import 'package:flutter/material.dart';

//storehouse
class GoalsProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> goals = [
    {
      "id": "1",
      "type": CategoryTypes.goals,
      "title": "Car",
      "icons": "",
      "allocated_amount": 800000,
      "transactions": [
        {
          "id": '2',
          "amount": 5500,
          "category": CategoryTypes.goals,
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