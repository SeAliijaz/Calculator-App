import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() {
    return _CalculatorScreenState();
  }
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C", 1),
                      buildButton("⌫", 1),
                      buildButton("÷", 1),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1),
                      buildButton("8", 1),
                      buildButton("9", 1),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1),
                      buildButton("5", 1),
                      buildButton("6", 1),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1),
                      buildButton("2", 1),
                      buildButton("3", 1),
                    ]),
                    TableRow(children: [
                      buildButton(".", 1),
                      buildButton("0", 1),
                      buildButton("00", 1),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("×", 1),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1),
                    ]),
                    TableRow(children: [
                      buildButton("+", 1),
                    ]),
                    TableRow(children: [
                      buildButton("=", 2),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(
    String buttonText,
    double buttonHeight,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: Colors.white,
      child: Card(
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.grey.shade100,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
