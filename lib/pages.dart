import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ios_toast/main.dart';

class Home extends StatelessWidget {
  static const platform = MethodChannel('com.example.flutter_swift/method');

  Future<void> _callSwiftMethod(BuildContext context) async {
    try {
      final String result = await platform.invokeMethod('swiftMethodName');
      result.toast(context);
      log(result); // Handle the result from Swift
    } on PlatformException catch (e) {
      log("Failed to call Swift method: '${e.message}'.");
    }
  }

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter & Swift Integration'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _callSwiftMethod(context),
          child: const Text('Call Swift Method'),
        ),
      ),
    );
  }
}
