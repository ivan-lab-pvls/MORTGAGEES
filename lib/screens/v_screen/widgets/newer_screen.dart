import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewerScreen extends StatelessWidget {
  const NewerScreen({
    super.key,
    required this.n,
  });
  final String n;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(n),
          ),
        ),
      ),
    );
  }
}
