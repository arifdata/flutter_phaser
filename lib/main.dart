import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

final InAppLocalhostServer localhostServer = InAppLocalhostServer(
  documentRoot: 'assets',
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localhostServer.start();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri("http://localhost:8080/index.html"),
          ),
        ),
      )),
    );
  }
}
