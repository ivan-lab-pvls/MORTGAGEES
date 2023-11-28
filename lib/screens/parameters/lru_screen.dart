import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LRUScreen extends StatefulWidget {
  const LRUScreen({super.key, required this.r});
  final String r;

  @override
  State<LRUScreen> createState() => _LRUScreenState();
}

class _LRUScreenState extends State<LRUScreen> {
  var _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            InAppWebView(
              onLoadStop: (controller, url) {
                controller.evaluateJavascript(
                    source:
                        "javascript:(function() { var ele=document.getElementsByClassName('docs-ml-header-item docs-ml-header-drive-link');ele[0].parentNode.removeChild(ele[0]);var footer = document.getelementsbytagname('footer')[0];footer.parentnode.removechild(footer);})()");
              },
              onProgressChanged: (controller, progress) => setState(() {
                _progress = progress;
              }),
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.r),
              ),
            ),
            if (_progress != 100)
              Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
