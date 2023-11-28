import 'package:in_app_review/in_app_review.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
  });

  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}


Future<void> rating(SharedPreferences shPre) async {
  final rev = InAppReview.instance;
  bool alreadyRated = shPre.getBool('rate') ?? false;
  if (!alreadyRated) {
    if (await rev.isAvailable()) {
      rev.requestReview();
      await shPre.setBool('rate', true);
    }
  }
}