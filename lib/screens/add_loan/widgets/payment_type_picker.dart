import 'package:mortgage/modles/mortgage.dart';
import 'package:flutter/material.dart';

class PaymentPicker extends StatelessWidget {
  const PaymentPicker({
    super.key,
    required this.paymentType,
    required this.onTap,
  });

  final PaymentType paymentType;
  final void Function(PaymentType) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => onTap(PaymentType.differential),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: paymentType == PaymentType.differential
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                'DIFFERENTIAL',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: paymentType == PaymentType.differential
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: InkWell(
            onTap: () => onTap(PaymentType.annuity),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: paymentType == PaymentType.annuity
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                'ANNUITY',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: paymentType == PaymentType.annuity
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
