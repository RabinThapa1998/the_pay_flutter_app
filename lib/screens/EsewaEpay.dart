import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EsewaEpay extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<EsewaEpay> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  late WebViewController _webViewController;

  String testUrl = "https://pub.dev/packages/webview_flutter";

  _loadHTMLfromAsset() async {
    String file = await rootBundle.loadString("assets/epay/epay_request.html");
    _webViewController.loadUrl(Uri.dataFromString(file,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  // ePay deatils
  double tAmt = 1000;
  double amt = 900;
  double txAmt = 100;
  double psc = 0;
  double pdc = 0;
  String scd = "EPAYTEST";
  String su = "https://github.com/RabinThapa1998";
  String fu = "https://developer.esewa.com.np/#/epay";

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ePay"),
      ),
      body: WebView(
        initialUrl: "about:blank",
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: Set.from([
          JavascriptChannel(
            name: "message",
            onMessageReceived: (message) {},
          ),
        ]),
        onPageFinished: (data) {
          String pid = UniqueKey().toString();
          _webViewController.evaluateJavascript(
              'requestPayment(tAmt = $tAmt, amt = $amt, txAmt = $txAmt, psc = $psc, pdc = $pdc, scd = "$scd", pid = "$pid", su = "$su", fu = "$fu")');
        },
        onWebViewCreated: (webViewController) {
          // _controller.complete(webViewController);
          _webViewController = webViewController;
          _loadHTMLfromAsset();
        },
      ),
    );
  }
}
