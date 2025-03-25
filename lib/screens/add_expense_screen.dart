// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/expense_provider.dart';
//
// class AddExpenseScreen extends StatelessWidget {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController amountController = TextEditingController();
//
//   void saveExpense(BuildContext context) {
//     final title = titleController.text;
//     final amount = double.tryParse(amountController.text) ?? 0.0;
//
//     if (title.isEmpty || amount <= 0) {
//       return;
//     }
//
//     Provider.of<ExpenseProvider>(context, listen: false)
//         .addExpense(title, amount);
//
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add Expense')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: TextEditingController(),
//               decoration: InputDecoration(labelText: "Expense title"),
//             ),
//             TextField(
//               controller: TextEditingController(),
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: "Amount"),
//             ),
//             ElevatedButton(
//                 onPressed: () => saveExpense(context),
//                 child: Text("Add Expense"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';

class AddExpenseScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String selectedCategory = "Other";

  void saveExpense(BuildContext context) {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text) ?? 0.0;

    if (title.isEmpty || amount <= 0) return;

    Provider.of<ExpenseProvider>(context, listen: false)
        .addExpense(title, amount, selectedCategory);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Expense')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: amountController, decoration: InputDecoration(labelText: 'Amount'), keyboardType: TextInputType.number),
            DropdownButton<String>(
              value: selectedCategory,
              items: ["Food", "Travel", "Shopping", "Other"].map((category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) {
                selectedCategory = value!;
              },
            ),
            ElevatedButton(onPressed: () => saveExpense(context), child: Text('Add Expense')),
          ],
        ),
      ),
    );
  }
}
