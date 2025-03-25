// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/expense.dart';
// import '../providers/expense_provider.dart';
//
// class ExpenseItem extends StatelessWidget {
//   final Expense expense;
//
//   ExpenseItem(this.expense);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: ListTile(
//         title: Text(expense.title),
//         // subtitle: Text(expense.date.toString()),
//         trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
//         onLongPress: () {
//           Provider.of<ExpenseProvider>(context, listen: false)
//               .removeExpense(expense.id);
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/expense.dart';
import '../providers/expense_provider.dart';
import '../screens/edit_expense_screen.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  ExpenseItem(this.expense);

  void _editExpense(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditExpenseScreen(expense),
      ),
    );
  }

  void _deleteExpense(BuildContext context) {
    Provider.of<ExpenseProvider>(context, listen: false)
        .deleteExpense(expense.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        title: Text(expense.title),
        subtitle: Text('Category: ${expense.category}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () => _editExpense(context),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteExpense(context),
            ),
          ],
        ),
        leading: Cir(
          backgroundColor: Colors.greenAccent,
          child: Text(
            '\$${expense.amount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
