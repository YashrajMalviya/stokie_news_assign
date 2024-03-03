import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsViewScreen extends StatelessWidget {
  final String link;

  const NewsViewScreen({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(link));

    return PopScope(
      onPopInvoked: (didPop) {
        Get.back();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News View'),
        ),
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
