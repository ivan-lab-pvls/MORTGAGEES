import 'package:mortgage/modles/mortgage.dart';
import 'package:flutter/material.dart';

class PayProgress extends StatelessWidget {
  const PayProgress({
    super.key,
    required this.hight,
    required this.loan,
  });

  final double hight;
  final Mortgage loan;

  @override
  Widget build(BuildContext context) {
    final amount = loan.amount;
    final payed = _getPayedSum();

    final percent = ((payed / amount) * 100).round();

    return Row(
      children: [
        Expanded(
          flex: percent,
          child: Container(
            height: hight,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Expanded(
          flex: 100 - percent,
          child: Container(
            height: hight,
            color: const Color(0xFFF6F6F6),
          ),
        ),
      ],
    );
  }

  int _getPayedSum() {
    int payed = 0;
    for (var payment in loan.payments) {
      payed += payment;
    }
    return payed;
  }
}
