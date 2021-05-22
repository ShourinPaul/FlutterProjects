import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Chartbar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctoftotal;
  Chartbar(this.label, this.spendingAmount, this.spendingPctoftotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            Container(
                height: constraints.maxHeight * .15,
                child: Container(
                  height: 20,
                  child: FittedBox(
                      child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
                )),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Container(
              height: constraints.maxHeight * .60,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromARGB(80, 127, 255, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: spendingPctoftotal,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 50, 205, 50),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Container(
                height: constraints.maxHeight * .15,
                child: FittedBox(child: Text(label))),
          ],
        );
      },
    );
  }
}
