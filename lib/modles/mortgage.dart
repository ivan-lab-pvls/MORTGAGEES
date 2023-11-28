// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'mortgage.g.dart';

@JsonSerializable()
class Mortgage {
  const Mortgage({
    required this.title,
    required this.amount,
    required this.rate,
    required this.term,
    required this.firstPaymentDate,
    required this.paymentType,
    required this.payments,
  });

  final String title;
  final int amount;
  final int rate;
  final int term;
  final DateTime firstPaymentDate;
  final PaymentType paymentType;
  final List<int> payments;

  double get monthlyPayment {
    final monthlyPayment = (amount / term) * rate * 0.05;
    return monthlyPayment;
  }

  int get alreadyPaid {
    int allPayments = 0;
    for (var payment in payments) {
      allPayments += payment;
    }
    return allPayments;
  }

  factory Mortgage.fromJson(Map<String, dynamic> json) =>
      _$MortgageFromJson(json);

  Map<String, dynamic> toJson() => _$MortgageToJson(this);

  Mortgage copyWith({
    String? title,
    int? amount,
    int? rate,
    int? term,
    DateTime? firstPaymentDate,
    PaymentType? paymentType,
    List<int>? payments,
  }) {
    return Mortgage(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      rate: rate ?? this.rate,
      term: term ?? this.term,
      firstPaymentDate: firstPaymentDate ?? this.firstPaymentDate,
      paymentType: paymentType ?? this.paymentType,
      payments: payments ?? this.payments,
    );
  }
}

enum PaymentType {
  annuity,
  differential,
}
