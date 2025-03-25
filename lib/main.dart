import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/expense_provider.dart';
import 'screens/expense_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//(ChangeNotifierProvider: Provides the expense data to the entire app. It listens for changes and updates widgets.)
    return ChangeNotifierProvider(
      create: (context) => ExpenseProvider(),         //( Our state manager where we manage expenses.)
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker',
        home: ExpenseListScreen(),        //(The first screen that appears.)
      ),
    );
  }
}

