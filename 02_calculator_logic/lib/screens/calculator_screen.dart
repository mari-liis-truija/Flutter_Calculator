import 'package:flutter/material.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _expression = "";
  String _operator = "";
  double _num1 = 0;
  double _num2 = 0;
  bool _clear = false;
  bool _isDecimal = false;

  void _handleButtonPress(String text) {
    setState(() {
      switch (text) {
        case "C":
          _output = "0";
          _expression = "";
          _operator = "";
          _num1 = 0;
          _num2 = 0;
          _clear = false;
          _isDecimal = false;
          break;
        case "+/-":
          if (_output != "0") {
            if (_output[0] == "-") {
              _output = _output.substring(1);
            } else {
              _output = "-" + _output;
            }
          }
          break;
        case "%":
          if (_output != "0") {
            _output = (double.parse(_output) / 100).toString();
          }
          break;
        case ",":
          if (!_isDecimal) {
            _output += ",";
            _isDecimal = true;
          }
          break;
        case ".":
          if (!_isDecimal) {
            _output += ".";
            _isDecimal = true;
          }
          break;
        case "+":
        case "-":
        case "x":
        case "÷":
          if (_num1 == 0) {
            _num1 = double.parse(_output);
            _operator = text;
            _expression = _output + _operator;
            _output = "0";
            _isDecimal = false;
          } else {
            _num2 = double.parse(_output);
            switch (_operator) {
              case "+":
                _num1 += _num2;
                break;
              case "-":
                _num1 -= _num2;
                break;
              case "x":
                _num1 *= _num2;
                break;
              case "÷":
                _num1 /= _num2;
                break;
            }
            _operator = text;
            _expression = _num1.toString() + _operator;
            _output = "0";
            _isDecimal = false;
          }
          break;
        case "=":
          if (_num1 != 0) {
            _num2 = double.parse(_output);
            switch (_operator) {
              case "+":
                _num1 += _num2;
                break;
              case "-":
                _num1 -= _num2;
                break;
              case "x":
                _num1 *= _num2;
                break;
              case "÷":
                _num1 /= _num2;
                break;
            }
            _output = _num1.toString();
            _expression = "";
            _num1 = 0;
            _num2 = 0;
            _operator = "";
            _isDecimal = false;
          }
          break;
        default:
          if (_clear) {
            _output = "0";
            _expression = "";
            _clear = false;
          }
          if (_output == "0") {
            _output = text;
          } else {
            _output += text;
          }
          break;
      }
    });
  }

  Widget buildButton(String text, Color color) {
    return CalculatorButton(
      text: text,
      color: color,
      onPressed: () => _handleButtonPress(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white10,
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        // backgroundColor: Colors.white10,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _output,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton("C", Colors.blueGrey[800]!),
              buildButton("+/-", Colors.blueGrey[800]!),
              buildButton("%", Colors.blueGrey[800]!),
              buildButton("÷", Colors.amber[900]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton("7", Colors.black12),
              buildButton("8", Colors.black12),
              buildButton("9", Colors.black12),
              buildButton("x", Colors.amber[900]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton("4", Colors.black12),
              buildButton("5", Colors.black12),
              buildButton("6", Colors.black12),
              buildButton("-", Colors.amber[900]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton("1", Colors.black12),
              buildButton("2", Colors.black12),
              buildButton("3", Colors.black12),
              buildButton("+", Colors.amber[900]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton("0", Colors.black12),
              buildButton(",", Colors.black12),
              buildButton(".", Colors.black12),
              buildButton("=", Colors.deepOrange[900]!),
            ],
          ),
        ],
      ),
    );
  }
}
