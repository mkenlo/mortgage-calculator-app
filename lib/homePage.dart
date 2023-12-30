import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:mortgage_calculator_app/widgets/SliderInput.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double purchasePrice = 100000;
  double downPayment = 20000;
  double repaymentTime = 15;
  double interestRate = 0.03;

  bool showCalculationResult = false;

  late double loanAmount ;
  double loanPerMonth = 900;


  @override
  void initState() {
    super.initState();
    loanAmount = purchasePrice - downPayment;
  }

  calculate() {
    double n = repaymentTime*12;
    double res = loanAmount*(interestRate*pow(1+interestRate,n)/(pow(1+interestRate,n)-1));
    setState(() {
      loanPerMonth = res;
      loanAmount = purchasePrice - downPayment;
      showCalculationResult = true;
    });

  }

  Widget estimateBtn() {
    return InkWell(
        onTap: () => calculate(),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5.0)),
          child: const Text("Get a mortgage quote",
              style: TextStyle(color: Colors.white)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(name:"\$",decimalDigits: 0);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title)),
        body: Container(
            decoration: BoxDecoration(color: Colors.grey.shade100),
            padding: const EdgeInsets.all(32.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SliderInput(
                  sliderLabel: "Purchase Price: ",
                  sliderValue: purchasePrice,
                  sliderMinValue: 50000,
                  sliderMaxValue: 5000000,
                  sliderValueFormat: NumberFormat.currency(symbol:"\$", decimalDigits: 0),
            ),
                  SliderInput(
                      sliderLabel: "Down Payment: ",
                      sliderValue: downPayment,
                      sliderMinValue: 10000,
                      sliderMaxValue: 500000,
                      sliderValueFormat: NumberFormat.currency(symbol:"\$", decimalDigits: 0),
                ),
                  SliderInput(
                      sliderLabel: "Repayment Time: ",
                      sliderValue: repaymentTime,
                      sliderMinValue: 1,
                      sliderMaxValue: 30,
                      sliderValueFormat: NumberFormat("## years"),
                ),
                  SliderInput(
                      sliderLabel: "Interest Rate: ",
                      sliderValue: interestRate,
                      sliderMinValue: 0.01,
                      sliderMaxValue: 1,
                      sliderValueFormat: NumberFormat("0.## %"),
                 ),
             Visibility(
               visible: showCalculationResult,
               child:   Expanded(
                 child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text("Loan amount"),
                       Padding(
                           padding: const EdgeInsets.only(top:5.0,bottom: 16.0),
                           child:Text(currencyFormat.format(loanAmount), style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold))),
                       const Text("Estimated per month"),
                       Padding(
                         padding: const EdgeInsets.only(top:5.0,bottom: 16.0),
                         child: Text(currencyFormat.format(loanPerMonth),style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),)
                     ]))),
              Center(child: estimateBtn())
            ])));
  }
}
