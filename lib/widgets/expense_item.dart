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

