import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.keyboardType,
    this.formatters = const [],
    this.enabled = true,
    required this.hintText,
  });

  final TextEditingController controller;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter> formatters;
  final bool enabled;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFF1F1F1),
        ),
      ),
      child: TextField(
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xFFC1C1C1),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        inputFormatters: formatters,
        keyboardType: keyboardType,
        onChanged: onChanged,
        controller: controller,
        style: const TextStyle(
          color: Color(0xFF363636),
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
