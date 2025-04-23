import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'widgets/utils.dart';

class FlutterAbsensiSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => FlutterAbsensiLogin()),
      );
    });
    return Scaffold(
      backgroundColor: Utils.mainThemeColor,
      body: const Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }
}