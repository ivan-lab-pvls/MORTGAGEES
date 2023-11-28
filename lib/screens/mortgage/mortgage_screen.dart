import 'package:mortgage/app_router.dart';
import 'package:mortgage/app_theme.dart';
import 'package:mortgage/modles/mortgage.dart';
import 'package:mortgage/modles/mortgages_change_notifier.dart';
import 'package:mortgage/screens/mortgage/widgets/mortgage_child.dart';
import 'package:mortgage/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MortgageScreen extends StatefulWidget {
  const MortgageScreen({super.key});

  @override
  State<MortgageScreen> createState() => _MortgageScreenState();
}

class _MortgageScreenState extends State<MortgageScreen> {
  late final MortgagesChangeNotifier _loansChangeNotifier;

  @override
  void initState() {
    super.initState();
    _loansChangeNotifier = context.read<MortgagesChangeNotifier>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListenableBuilder(
          listenable: _loansChangeNotifier,
          builder: (context, child) {
            return CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                const SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Tus hipotecas',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xFF363636),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _loansChangeNotifier.loans.isEmpty
                    ? SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Esta vacio",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.blackColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Agregue información sobre su hipoteca haciendo clic en el botón "Agregar préstamo"',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.lightColor,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: AppButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 50,
                                  onTap: () => _onAddLoanTap(context),
                                  text: 'AÑADIR HIPOTECA',
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SliverPadding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                        ),
                        sliver: SliverList.builder(
                          itemCount: _loansChangeNotifier.loans.length + 1,
                          itemBuilder: (context, index) {
                            if (index == _loansChangeNotifier.loans.length) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: AppButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 50,
                                  onTap: () => _onAddLoanTap(context),
                                  text: 'AÑADIR HIPOTECA',
                                ),
                              );
                            }
                            final loan = _loansChangeNotifier.loans[index];

                            return MortgageChild(loan: loan);
                          },
                        ),
                      ),
              ],
            );
          }),
    );
  }

  void _onAddLoanTap(BuildContext context) async {
    final result = await context.push<Mortgage?>(AppRouter.addMortgage);
    if (result == null) return;
    _loansChangeNotifier.addMortgage(result);
  }
}
