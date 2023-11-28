import 'package:flutter/material.dart';
import 'package:mortgage/modles/mortgage.dart';
import 'package:mortgage/screens/add_loan/add_mortgage_screen.dart';
import 'package:mortgage/screens/add_payment/add_payment_screen.dart';
import 'package:mortgage/screens/finance_info/finance_info.dart';
import 'package:mortgage/screens/finance_screen/finance_screen.dart';
import 'package:mortgage/screens/v_screen/v_screen.dart';
import 'package:mortgage/screens/mortgage/mortgage_screen.dart';
import 'package:mortgage/screens/main_builder/main_builder.dart';
import 'package:mortgage/screens/mortgage_detailed_screen/mortgage_detailed_screen.dart';
import 'package:mortgage/screens/parameters/lru_screen.dart';
import 'package:mortgage/screens/parameters/parameters_screen.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _parentKey = GlobalKey<NavigatorState>();

class AppRouter {
  static const String i = '/i';

  static const String mortgage = '/mortgage';

  static const String finance = '/finance';
  static const String financeInfo = '/financeInfo';

  static const String parameters = '/parameters';

  static const String addMortgage = '/addLoan';
  static const String mortgageDetailed = '/loamortgageDetailedn';
  static const String addPayment = '/addPayment';
  static const String ppu = '/ppu';

  static GoRouter get config => GoRouter(
        navigatorKey: _parentKey,
        initialLocation: i,
        routes: [
          GoRoute(
            path: i,
            name: i,
            builder: (context, state) => const VScreen(),
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                MainBuilder(child: navigationShell),
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: mortgage,
                    name: mortgage,
                    builder: (context, state) => const MortgageScreen(),
                  ),
                  GoRoute(
                    path: addMortgage,
                    name: addMortgage,
                    builder: (context, state) => const AddMortgageScreen(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: finance,
                    name: finance,
                    builder: (context, state) => const FinancialScreen(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: parameters,
                    name: parameters,
                    builder: (context, state) => const ParametersScreen(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            parentNavigatorKey: _parentKey,
            path: mortgageDetailed,
            name: mortgageDetailed,
            builder: (context, state) =>
                MortgageDetailedScreen(loan: state.extra as Mortgage),
          ),
          GoRoute(
            parentNavigatorKey: _parentKey,
            path: addPayment,
            name: addPayment,
            builder: (context, state) => const AddPaymentScreen(),
          ),
          GoRoute(
            parentNavigatorKey: _parentKey,
            path: financeInfo,
            name: financeInfo,
            builder: (context, state) => FinanceInfo(fp: state.extra as FP),
          ),
          GoRoute(
            parentNavigatorKey: _parentKey,
            path: ppu,
            name: ppu,
            builder: (context, state) => LRUScreen(r: state.extra as String),
          ),
        ],
      );
}
