// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/expense_provider.dart';
// import '../widgets/expense_item.dart';
// import 'add_expense_screen.dart';
//
// class ExpenseListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final expenseProvider = Provider.of<ExpenseProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Expense Tracker'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => AddExpenseScreen()),
//               );
//             },
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(                    //(Displaying the total amount of all expenses in the Expense Tracker)
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Total: \$${expenseProvider.totalAmount.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: expenseProvider.expenses.length,
//               itemBuilder: (ctx, index) {
//                 return ExpenseItem(expenseProvider.expenses[index]);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import '../widgets/expense_item.dart';
import '../widgets/category_filter.dart';
import 'add_expense_screen.dart';

class ExpenseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddExpenseScreen()),
                );
              },
              child: Text("Add items")
          ),
          SizedBox(height: 4),
          CategoryFilter(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${expenseProvider.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 4),
          Expanded(
            child: ListView.builder(
              itemCount: expenseProvider.expenses.length,
              itemBuilder: (ctx, index) {
                return ExpenseItem(expenseProvider.expenses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

