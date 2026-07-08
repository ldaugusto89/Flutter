import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transaction, {super.key});

  final List<Transaction> transaction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transaction.isEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Nenhuma Transação Cadastrada!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (ctx, index) {
                final e = transaction[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(child: Text('R\$${e.value}')),
                      ),
                    ),
                    title: Text(
                      e.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(DateFormat('d MMM Y').format(e.date)),
                  ),
                );
              },
            ),
    );
  }
}
