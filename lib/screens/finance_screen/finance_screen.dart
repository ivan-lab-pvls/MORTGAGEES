import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mortgage/app_router.dart';

class FinancialScreen extends StatelessWidget {
  const FinancialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                bottom: 16,
                top: 16,
              ),
              child: Text(
                'Financiera',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color(0xFF363636),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: FP.values.length,
                itemBuilder: (context, index) {
                  final fp = FP.values[index];
                  return GestureDetector(
                    onTap: () => context.pushNamed(
                      AppRouter.financeInfo,
                      extra: fp,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color(0xFFF1F1F1),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: SvgPicture.network(
                                  "https://s3-symbol-logo.tradingview.com/country/${fp.firstCode}.svg",
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              const SizedBox(width: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: SvgPicture.network(
                                  "https://s3-symbol-logo.tradingview.com/country/${fp.secondCode}.svg",
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            fp.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF21212D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on FP {
  String get secondCode => '${name[3]}${name[4]}';
  String get firstCode => '${name[0]}${name[1]}';
}

enum FP {
  AUDUSD,
  USDCAD,
  GBPUSD,
  USDCHF,
  NZDUSD,
  EURGBP,
  GBPJPY,
  AUDJPY,
  EURAUD,
  GBPAUD,
  EURJPY,
  GBPCAD,
  EURUSD,
  AUDCAD,
  CADJPY,
  USDJPY,
  EURCAD,
}
