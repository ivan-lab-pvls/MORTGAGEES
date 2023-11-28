import 'package:mortgage/app_theme.dart';
import 'package:mortgage/modles/mortgage.dart';
import 'package:mortgage/screens/add_loan/widgets/payment_type_picker.dart';
import 'package:mortgage/widgets/custom_text_field.dart';
import 'package:mortgage/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddMortgageScreen extends StatefulWidget {
  const AddMortgageScreen({super.key});

  @override
  State<AddMortgageScreen> createState() => _AddMortgageScreenState();
}

class _AddMortgageScreenState extends State<AddMortgageScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _termController = TextEditingController();
  final TextEditingController _firstPaymentDateController =
      TextEditingController();

  PaymentType _paymentType = PaymentType.annuity;
  DateTime? firstPaymentDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => context.pop(),
                      child: SvgPicture.asset('icons/back.svg'),
                    ),
                    const Text(
                      'AÑADIR HIPOTECA',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.blackColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Título',
                        controller: _titleController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        hintText: 'Cantidad',
                        controller: _amountController,
                        formatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        onChanged: (value) {
                          if (!value.contains('\$')) {
                            final newValue = '$value\$';
                            _amountController.value = TextEditingValue(
                              text: newValue,
                              selection: TextSelection.collapsed(
                                offset: newValue.length - 1,
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        hintText: 'Tasa',
                        formatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        controller: _rateController,
                        onChanged: (value) {
                          if (value.length > 2) {
                            value = value.substring(0, 2);
                          }
                          if (!value.contains('%')) {
                            final newValue = '$value%';
                            _rateController.value = TextEditingValue(
                              text: newValue,
                              selection: TextSelection.collapsed(
                                offset: newValue.length - 1,
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        hintText: 'Término',
                        formatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        controller: _termController,
                        onChanged: (value) {
                          if (!value.contains('months')) {
                            final newValue = '$value months';
                            _termController.value = TextEditingValue(
                              text: newValue,
                              selection: TextSelection.collapsed(
                                offset: newValue.length - 7,
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          final result = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .copyWith(year: DateTime.now().year - 30),
                            lastDate: DateTime.now()
                                .copyWith(year: DateTime.now().year + 30),
                          );
                          if (result == null) return;
                          firstPaymentDate = result;
                          _firstPaymentDateController.text =
                              DateFormat('dd.MM.yyyy').format(result);
                        },
                        child: CustomTextField(
                          enabled: false,
                          hintText: 'Primera fecha de pago',
                          controller: _firstPaymentDateController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 28),
                      const Text(
                        'Tipo de pago',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFC1C1C1),
                        ),
                      ),
                      const SizedBox(height: 12),
                      PaymentPicker(
                        onTap: (value) {
                          setState(() {
                            _paymentType = value;
                          });
                        },
                        paymentType: _paymentType,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: AppButton(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.5,
          onTap: () => _onAddLoanTap(context),
          text: 'AÑADIR HIPOTECA',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  void _onAddLoanTap(BuildContext context) {
    if (firstPaymentDate == null ||
        _amountController.text.isEmpty ||
        _rateController.text.isEmpty ||
        _termController.text.isEmpty ||
        _titleController.text.isEmpty) {
      return;
    }

    final int amount = int.tryParse(_amountController.text
            .substring(0, _amountController.text.length - 1)) ??
        0;
    final int rate = int.tryParse(_rateController.text
            .substring(0, _rateController.text.length - 1)) ??
        0;
    final int term = int.tryParse(_termController.text
            .substring(0, _termController.text.length - 7)) ??
        0;

    final loan = Mortgage(
      title: _titleController.text,
      amount: amount,
      rate: rate,
      term: term,
      firstPaymentDate: firstPaymentDate!,
      paymentType: _paymentType,
      payments: [],
    );

    context.pop(loan);
  }
}
