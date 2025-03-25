import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';

class CategoryFilter extends StatelessWidget {
  final List<String> categories = ["All", "Food", "Travel", "Shopping"];

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: expenseProvider.selectedCategory,
        items: categories.map((category) {
          return DropdownMenuItem(
            value: category,
            child: Text(category),
          );
        }).toList(),
        onChanged: (value) {
          expenseProvider.setCategoryFilter(value!);
        },
        isExpanded: true,
        hint: Text("Select Category"),
      ),
    );
  }
}
