// import 'package:flutter/material.dart';
// import '../models/expense.dart';
//
// class ExpenseProvider with ChangeNotifier {         //(ChangeNotifier: Manages state and notifies listeners.)
//  final List<Expense> _expenses = [];
//
//   List<Expense> get expenses => _expenses;
//
//   double get totalAmount =>       //(It will calculate the sum of all expense amount added)
//       _expenses.fold(0.0, (sum, item) => sum + item.amount);
//
//   void addExpense(String title, double amount) {
//     final newExpense = Expense(
//       id: DateTime.now().toString(),        //(Today's date and time)
//       title: title,                         //(item name)
//       amount: amount,                       //(Cost of the Item)
//       date: DateTime.now(),
//
//     );
//     _expenses.add(newExpense);
//     notifyListeners();          //(Triggers UI updates.)
//   }
//
//   void removeExpense(String id) {
//     _expenses.removeWhere((expense) => expense.id == id);
//     notifyListeners();          //(Triggers UI updates.)
//   }
// }


import 'package:flutter/material.dart';
import '../models/expense.dart';


class ExpenseProvider with ChangeNotifier {
  final List<Expense> _expenses = [];

  String _selectedCategory = "All";

  List<Expense> get expenses {
    if (_selectedCategory == "All") {
      return _expenses;
    }
    return _expenses.where((e) => e.category == _selectedCategory).toList();
  }

  double get totalAmount =>
      expenses.fold(0.0, (sum, item) => sum + item.amount);

  String get selectedCategory => _selectedCategory;

  void addExpense(String title, double amount, String category) {
    _expenses.add(Expense(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      category: category,
    ));
    notifyListeners();
  }

  void editExpense(String id, String newTitle, double newAmount, String newCategory) {
    final index = _expenses.indexWhere((expense) => expense.id == id);
    if (index != -1) {
      _expenses[index].title = newTitle;
      _expenses[index].amount = newAmount;
      _expenses[index].category = newCategory;
      notifyListeners();
    }
  }

  void deleteExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    notifyListeners();
  }

  void setCategoryFilter(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
