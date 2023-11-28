import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mortgage/screens/finance_screen/finance_screen.dart';

class FinanceInfo extends StatelessWidget {
  const FinanceInfo({super.key, required this.fp});
  final FP fp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => context.pop(),
          child: UnconstrainedBox(
            child: SvgPicture.asset('icons/back.svg'),
          ),
        ),
        elevation: 0,
        title: const Text('Información financiera'),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialData: InAppWebViewInitialData(
                data: """<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div id="tradingview_a4086"></div>
  <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
  "autosize": true,
  "symbol": "FX:${fp.name}",
  "interval": "D",
  "timezone": "Etc/UTC",
  "theme": "light",
  "style": "1",
  "locale": "en",
  "enable_publishing": false,
  "allow_symbol_change": true,
  "container_id": "tradingview_a4086"
}
  );
  </script>
</div>
<!-- TradingView Widget END -->"""),
          ),
        ],
      ),
    );
  }
}
