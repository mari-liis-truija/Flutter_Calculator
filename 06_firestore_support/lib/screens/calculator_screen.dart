import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../widgets/calculator_button.dart';
import 'history_screen.dart';
import 'km_to_mile_screen.dart';
import '../helpers/database_helper.dart';

class CalculatorScreen extends StatelessWidget {
  final TextEditingController inputController = TextEditingController();
  final TextEditingController outputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          actions: [
            IconButton(
              icon: Icon(Icons.swap_horiz),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => KmToMileScreen()),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: inputController,
                decoration: InputDecoration(
                  hintText: "Enter expression",
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text("Calculate"),
                onPressed: () {
                  String expression = inputController.text;
                  Parser parser = Parser();
                  Expression exp = parser.parse(expression);
                  ContextModel cm = ContextModel();
                  double result = exp.evaluate(EvaluationType.REAL, cm);
                  outputController.text = result.toString();
                  Map<String, dynamic> history = {
                    DatabaseProvider.COLUMN_EXPRESSION: expression,
                    DatabaseProvider.COLUMN_RESULT: result.toString(),
                  };
                  DatabaseProvider.insertHistory(history);
                },
              ),
              SizedBox(height: 16),
              TextField(
                controller: outputController,
                decoration: InputDecoration(
                  hintText: "Result",
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text("History"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryScreen()),
                  );
                },
              ),
            ],
          ),
        ),

    );
  }
}
