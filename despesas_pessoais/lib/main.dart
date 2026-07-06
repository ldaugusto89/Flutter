import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final transactions = [
      Transaction(id: 't1', title: 'testes', value: 100, date: DateTime.now())
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Text('Card 1'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: 
              transactions.map((e){
                return Card(child: Text(e.title));
              }).toList()
          ),
        ],
      ),
    );
  }
}