import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/login_service.dart';
import '../widgets/utils.dart';
import '../widgets/main_button.dart';
import '../FlutterAbsensiMain.dart';
import '../main.dart';

class FlutterAbsensiLogin extends StatefulWidget {
  @override
  FlutterAbsensiLoginState createState() => FlutterAbsensiLoginState();
}

class FlutterAbsensiLoginState extends State<FlutterAbsensiLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validateEmailAndPassword() {
    String email = usernameController.text.trim();
    String password = passwordController.text;
    return Utils.validateEmail(email) && password.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(width: 7, color: Colors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset('assets/smanic.jpeg'),
            ),
            const SizedBox(height: 30),
            const Text('Welcome to', style: TextStyle(color: Colors.grey, fontSize: 15)),
            const Text(
              'Absensi\nSMAN 1 CIAWI',
              style: TextStyle(color: Utils.mainThemeColor, fontSize: 30),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Sign Into Your Absensi Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 10),
                    Utils.generateInputField(
                      "Email",
                      Icons.email,
                      usernameController,
                      false,
                          (_) => setState(() {}),
                    ),
                    Utils.generateInputField(
                      "Password",
                      Icons.lock,
                      passwordController,
                      true,
                          (_) => setState(() {}),
                    ),
                  ],
                ),
              ),
            ),
            FlutterAbsensiMainButton(
              label: 'Log In',
              enabled: validateEmailAndPassword(),
              onTap: () async {
                final loginService = Provider.of<LoginService>(context, listen: false);
                bool isLoggedIn = await loginService.signInWithEmailAndPassword(
                  usernameController.text,
                  passwordController.text,
                );
                if (isLoggedIn) {
                  usernameController.clear();
                  passwordController.clear();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => FlutterAbsensiMain()),
                  );
                }
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}