import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.delFun,
  }) : super(key: key);

  final Transaction transaction;
  final Function delFun;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () {
                  delFun(transaction.id);
                },
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                label: Text('Delete'))
            : IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  delFun(transaction.id);
                },
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
