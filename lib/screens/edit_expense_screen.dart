import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import '../models/expense.dart';

class EditExpenseScreen extends StatefulWidget {
  final Expense expense;
  EditExpenseScreen(this.expense);

  @override
  _EditExpenseScreenState createState() => _EditExpenseScreenState();
}

class _EditExpenseScreenState extends State<EditExpenseScreen> {
  late TextEditingController titleController;
  late TextEditingController amountController;
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.expense.title);
    amountController = TextEditingController(text: widget.expense.amount.toString());
    selectedCategory = widget.expense.category;
  }

  void saveChanges(BuildContext context) {
    Provider.of<ExpenseProvider>(context, listen: false)
        .editExpense(widget.expense.id, titleController.text, double.parse(amountController.text), selectedCategory);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Expense')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: amountController, decoration: InputDecoration(labelText: 'Amount'), keyboardType: TextInputType.number),
            DropdownButton<String>(
              value: selectedCategory,
              items: ["Food", "Travel", "Shopping"].map((category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
            ElevatedButton(onPressed: () => saveChanges(context), child: Text('Save Changes')),
          ],
        ),
      ),
    );
  }
}
