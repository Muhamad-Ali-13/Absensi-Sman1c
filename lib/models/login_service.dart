import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService extends ChangeNotifier {
  String _userId = '';
  String _errorMessage = '';

  String getErrorMessage() => _errorMessage;

  void setLoginErrorMessage(String msg) {
    _errorMessage = msg;
    notifyListeners();
  }

  String getUserId() => _userId;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    setLoginErrorMessage('');
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.102:8080/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _userId = data['id'].toString();
        return true;
      } else {
        setLoginErrorMessage('Email atau password salah.');
        return false;
      }
    } catch (e) {
      setLoginErrorMessage('Login error: $e');
      return false;
    }
  }
}