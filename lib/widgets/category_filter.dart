// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/expense_provider.dart';
//
// class CategoryFilter extends StatelessWidget {
//   final List<String> categories = ["All", "Food", "Travel", "Shopping"];
//
//   @override
//   Widget build(BuildContext context) {
//     final expenseProvider = Provider.of<ExpenseProvider>(context);
//
//     return Padding(
//
//       padding: const EdgeInsets.all(8.0),
//       child: DropdownButton<String>(
//         value: expenseProvider.selectedCategory,
//         items: categories.map((category) {
//           return DropdownMenuItem(
//             value: category,
//             child: Text(category),
//           );
//         }).toList(),
//         onChanged: (value) {
//           expenseProvider.setCategoryFilter(value!);
//         },
//         isExpanded: true,
//         hint: Text("Select Category"),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';

class CategoryFilter extends StatelessWidget {
  final List<String> categories = ['All', 'Food', 'Travel', 'Shopping', 'Others'];

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pink[10],
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<String>(
        value: expenseProvider.selectedCategory,
        onChanged: (newCategory) {
          expenseProvider.setCategoryFilter(newCategory!);
        },
        items: categories.map((category) {
          return DropdownMenuItem(
            value: category,
            child: Text(
              category,
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        dropdownColor: Colors.white, // Dropdown menu color
        underline: SizedBox(),  // Removes the underline
        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
        style: TextStyle(fontSize: 16, color: Colors.black),  // Text style
        isExpanded: false,  // Avoid stretching
      ),
    );
  }
}
