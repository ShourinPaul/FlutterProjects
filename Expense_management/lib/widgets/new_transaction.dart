import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addval;

  NewTransaction(this.addval);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleIndex = TextEditingController();
  DateTime _chosenDate;
  final _amountIndex = TextEditingController();

  void _submitdata() {
    final amount = double.parse(_amountIndex.text);
    if (_titleIndex.text.isEmpty || amount <= 0 || _chosenDate == null) {
      return;
    }
    widget.addval(_titleIndex.text, amount, _chosenDate);
    Navigator.of(context).pop();
  }

  void _percentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null)
        return;
      else
        setState(() {
          _chosenDate = value;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleIndex,
                keyboardType: TextInputType.name,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountIndex,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitdata(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_chosenDate == null
                          ? 'No date chosen!'
                          : 'Picked Date: ${DateFormat.yMEd().format(_chosenDate)}'),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _percentDatePicker,
                      child: Text(
                        'Chosen date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Add Transaction'),
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitdata,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
