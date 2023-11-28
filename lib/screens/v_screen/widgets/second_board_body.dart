import 'package:flutter/material.dart';
import 'package:mortgage/app_theme.dart';
import 'package:mortgage/widgets/app_button.dart';

class SecondBoardBody extends StatelessWidget {
  const SecondBoardBody({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(flex: 5),
          Image.asset(
            'icons/messages_stars.png',
            height: MediaQuery.of(context).size.height * 0.25,
            fit: BoxFit.fitWidth,
          ),
          const Spacer(flex: 3),
          const Text(
            'We value your feedback',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppTheme.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const Text(
            'Every day we are getting better due to your ratings and reviews — that helps us protect your accounts.',
            style: TextStyle(
              fontSize: 11,
              color: AppTheme.greyColor,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          AppButton(
            width: MediaQuery.of(context).size.width * 0.7,
            text: 'CONTINUE',
            onTap: onTap,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 4,
                width: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFF5C5C65),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 4,
                width: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFFF0F0F0),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            'Terms of Use  |  Privacy Policy',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFFC1C1C1),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
