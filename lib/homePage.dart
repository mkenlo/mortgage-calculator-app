
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{

  calculate(){ }

  Widget estimateBtn(){
    return InkWell(
      onTap: ()=> calculate(),
      child: Container(
        padding: const EdgeInsets.all(24.0),
    decoration: BoxDecoration(
    color: Theme.of(context).primaryColor,
    borderRadius:  BorderRadius.circular(5.0)),

    child: const Text("Get a mortgage quote", style: TextStyle(color: Colors.white)),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(widget.title)
    ),
    body: Container(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      padding: const EdgeInsets.all(32.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      const Row(
        children: [ Text("Purchase Price: "), Text("450000")],
      ),
      Slider(
        value: 450000,
        min: 50000,
        max: 10000000,
        label: "450000",
        onChanged: (double value) {

        },
      ),
      const Row(
        children: [ Text("Down Payment: "), Text("450000")],
      ),
      Slider(
        value: 450000,
        min: 10000,
        max: 10000000,
        label: "450000",
        onChanged: (double value) {

        },
      ),
      const Row(
        children: [ Text("Repayment Time: "), Text("25 years")],
      ),
      Slider(
        value: 15,
        max: 30,
        label: "15",
        onChanged: (double value) {

        },
      ),
      const Row(
        children: [ Text("Interest Rate: "), Text("3%")],
      ),
      Slider(
        value: 3.99,
        max: 10,
        label: "3.99",
        onChanged: (double value) {

        },
      ),
      const Expanded(

          child:  Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [ Text("Loan amount"),
         Text("315000"),
         Text("Estimated per month"),
        Text("1300")]
      )),
      Center(child:estimateBtn())

    ]
    )
    ));
  }
}