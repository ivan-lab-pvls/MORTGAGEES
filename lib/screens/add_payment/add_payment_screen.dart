import 'package:mortgage/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({super.key});

  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  final TextEditingController _paymentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => context.pop(),
                    child: SvgPicture.asset('icons/back.svg'),
                  ),
                  const Text(
                    'INFORMACIÓN DEL PRÉSTAMO',
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            SliverFillRemaining(
              child: Center(
                child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: _paymentController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  onChanged: (value) {
                    if (!value.contains('\$')) {
                      final newValue = '$value\$';
                      _paymentController.value = TextEditingValue(
                        text: newValue,
                        selection: TextSelection.collapsed(
                          offset: newValue.length - 1,
                        ),
                      );
                    }
                  },
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF363636),
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AppButton(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 50,
        onTap: () {
          if (_paymentController.text.isEmpty) return;
          final int? amount = int.tryParse(_paymentController.text
              .substring(0, _paymentController.text.length - 1));
          if (amount == null) return;

          context.pop(amount);
        },
        text: 'AÑADIR PAGO',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
