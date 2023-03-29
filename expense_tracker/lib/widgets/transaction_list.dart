import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constrains) {
            return Column(
              children: [
                Text(
                  'No transaction',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: constrains.maxHeight * 0.05),
                Container(
                  height: constrains.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        :
        // ListView.builder(
        //     itemBuilder: (ctx, index) {
        //       return TransactionItem(
        //           transaction: transactions[index],
        //           removeTransaction: removeTransaction);
        //     },
        //     itemCount: transactions.length,
        //   );
        ListView(
            children: transactions
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    removeTransaction: removeTransaction))
                .toList(),
          );
  }
}
