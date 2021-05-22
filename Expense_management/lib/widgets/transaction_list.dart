import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'Transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delFun;
  TransactionList(this.transactions, this.delFun);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: transactions.isEmpty
            ? LayoutBuilder(
                builder: (ctx, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Transaction is made yet!!',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: constraints.maxHeight * .6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                },
              )
            : ListView.builder(
                itemBuilder: (buildContext, index) {
                  return TransactionItem(
                      transaction: transactions[index], delFun: delFun);
                },
                itemCount: transactions.length,
              ));
  }
}
