import 'package:flutter/material.dart';
import 'package:route/calculator/calcButton.dart';

class Calculatorscreen extends StatefulWidget {
  const Calculatorscreen({super.key});

  @override
  State<Calculatorscreen> createState() => _CalculatorscreenState();
}

class _CalculatorscreenState extends State<Calculatorscreen> {
  String displayNum = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              color: Colors.orange,
              alignment: Alignment.centerLeft,
              child: Text(
                displayNum,
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Calcbutton(
                  label: "9",
                  onClick: onclicked,
                ),
                Calcbutton(
                  label: "8",
                  onClick: onclicked,
                ),
                Calcbutton(
                  label: "7",
                  onClick: onclicked,
                ),
                Calcbutton(
                  label: "/",
                  onClick: onOperaterclicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Calcbutton(
                  label: "6",
                  onClick: onclicked,
                ),
                Calcbutton(
                  label: "5",
                  onClick: onclicked,
                ),
                Calcbutton(
                  label: "4",
                  onClick: onclicked,
                ),
                Calcbutton(
                  label: "*",
                  onClick: onOperaterclicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Calcbutton(
                  label: "3",
                  onClick: onclicked,
                ),
                Calcbutton(
                  label: "2",
                  onClick: onclicked,
                ),
                Calcbutton(
                  label: "1",
                  onClick: onclicked,
                ),
                Calcbutton(
                  label: "-",
                  onClick: onOperaterclicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Calcbutton(
                  label: "0",
                  onClick: onclicked,
                ),
                Calcbutton(
                  label: ".",
                  onClick: onclicked,
                ),
                Calcbutton(
                  label: "+",
                  onClick: onOperaterclicked,
                ),
                Calcbutton(
                  label: "=",
                  onClick: onEqualclicked,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  onclicked(number) {
    displayNum += number;
    setState(() {});
  }

  String lhs = "";
  String rhs = "";
  String op = "";
  calcResult(String lhs, String operator, String rhs) {
    double LHS = double.parse(lhs);

    double RHS = double.parse(rhs);

    if (operator == "+") {
      double res = LHS + RHS;
      return res.toString();
    } else if (operator == "-") {
      double res = LHS - RHS;
      return res.toString();
    } else if (operator == "*") {
      double res = LHS * RHS;
      return res.toString();
    } else if (operator == "/") {
      double res = LHS / RHS;
      return res.toString();
    } else {
      return "";
    }
  }

  onEqualclicked(eaualOperator) {
    String result = calcResult(lhs, op, displayNum);
    displayNum = result;

    setState(() {});
    lhs = "";
    op = "";
  }

  onOperaterclicked(operator) {
    if (lhs.isEmpty) {
      lhs = displayNum;
    } else {
      lhs = calcResult(lhs, op, displayNum);
    }
    op = operator;
    displayNum = "";
    setState(() {});
  }
}
