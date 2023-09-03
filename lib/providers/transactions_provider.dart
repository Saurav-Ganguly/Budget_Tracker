import 'package:flutter/material.dart';

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
      "amount": 1500,
      "category": "1",
      "date": "3/9/2023",
    },
    {
      "id": '3',
      "amount": 1300,
      "category": "2",
      "date": "3/9/2023",
    },
    {
      "id": '4',
      "amount": 15000,
      "category": "4",
      "date": "3/9/2023",
    },
    {
      "id": '5',
      "amount": 5000,
      "category": "5",
      "date": "3/9/2023",
    },
    {
      "id": '6',
      "amount": 10000,
      "category": "6",
      "date": "3/9/2023",
    },
    {
      "id": '7',
      "amount": 500,
      "category": "5",
      "date": "3/9/2023",
    },
    {
      "id": '8',
      "amount": 200,
      "category": "3",
      "date": "3/9/2023",
    },
    {
      "id": '9',
      "amount": 700,
      "category": "3",
      "date": "3/9/2023",
    },
    {
      "id": '10',
      "amount": 800,
      "category": "2",
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