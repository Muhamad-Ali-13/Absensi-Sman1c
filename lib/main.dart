import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/login_service.dart';
import 'splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginService()),
      ],
      child: FlutterAbsensiApp(),
    ),
  );
}

class FlutterAbsensiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: FlutterAbsensiSplash(),
    );
  }
}