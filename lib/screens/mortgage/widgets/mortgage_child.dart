import 'package:mortgage/app_router.dart';
import 'package:mortgage/modles/mortgage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MortgageChild extends StatelessWidget {
  const MortgageChild({
    super.key,
    required this.loan,
  });

  final Mortgage loan;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => context.push(AppRouter.mortgageDetailed, extra: loan),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        color: const Color(0xFFF9F9FE),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loan.title,
                    style: const TextStyle(
                      color: Color(0xFF363636),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Your monthly payment: ${loan.monthlyPayment.toStringAsFixed(2)}\$',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFC1C1C1),
                    ),
                  ),
                  Text(
                    'Already paid: ${loan.alreadyPaid.toStringAsFixed(2)}\$',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFC1C1C1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Stack(
              children: [
                SizedBox.square(
                  dimension: 45,
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                    backgroundColor: const Color(0xFFF1F3FF),
                    color: Theme.of(context).primaryColor,
                    value: loan.alreadyPaid / loan.amount,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      '${((loan.alreadyPaid / loan.amount) * 100).round().toString()}%',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                        color: Color(0xFF363636),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
