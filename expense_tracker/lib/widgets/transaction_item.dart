import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.removeTransaction,
  });

  // final List<Transaction> transaction;
  final Transaction transaction;
  final Function removeTransaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor = Colors.purple;

  @override
  void initState() {
    const availableCOLORS = [
      Colors.green,
      Colors.blue,
      Colors.amber,
      Colors.cyan
    ];
    _bgColor = availableCOLORS[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          // backgroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text(
              '\$${widget.transaction.amount}',
              style: Theme.of(context).textTheme.titleSmall,
            )),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => widget.removeTransaction(widget.transaction.id),
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
