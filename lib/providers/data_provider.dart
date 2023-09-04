import 'package:budget_tracker/global_vars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//storehouse of our data
class DataProvider extends ChangeNotifier {
  //monthly income
  int? income;

  //monthly expenses
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

  //monthly savings
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

  //monthly goals
  final List<Map<String, dynamic>> goals = [
    {
      "id": "1",
      "type": CategoryTypes.goals,
      "title": "Car",
      "icons": "",
      "allocated_amount": 800000,
      "monthly_allocation": 10000,
      "time": "10 years",
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

  //add new item
  void addItem({
    required Map<String, dynamic> item,
    required CategoryTypes category,
  }) {
    if (category == CategoryTypes.expenses) {
      expenses.add(item);
    } else if (category == CategoryTypes.savings) {
      savings.add(item);
    } else if (category == CategoryTypes.goals) {
      goals.add(item);
    }

    notifyListeners();
  }

  //remove an item
  void removeItem({
    required Map<String, dynamic> item,
    required CategoryTypes category,
  }) {
    if (category == CategoryTypes.expenses) {
      expenses.remove(item);
    } else if (category == CategoryTypes.savings) {
      savings.remove(item);
    } else if (category == CategoryTypes.goals) {
      goals.remove(item);
    }

    notifyListeners();
  }

  //edit an item
  void editItem({
    //id of the element you wanna edit
    required String id,
    //new item to be added
    required Map<String, dynamic> newItem,
    required CategoryTypes category,
  }) {
    if (category == CategoryTypes.expenses) {
      for (final (index, element) in expenses.indexed) {
        if (element['id'] == id) {
          expenses[index] = newItem;
        }
      }
    } else if (category == CategoryTypes.savings) {
      for (final (index, element) in savings.indexed) {
        if (element['id'] == id) {
          savings[index] = newItem;
        }
      }
    } else if (category == CategoryTypes.goals) {
      for (final (index, element) in goals.indexed) {
        if (element['id'] == id) {
          goals[index] = newItem;
        }
      }
    }
    notifyListeners();
  }
}
