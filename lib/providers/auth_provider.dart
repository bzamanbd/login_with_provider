import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  //========================//
  bool _isObscureText = true;
  bool get isObscureText => _isObscureText;
  void toggleObscureText() {
    _isObscureText = !isObscureText;
    notifyListeners();
  }
  //========================//

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      setLoading(true);
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        setLoading(false);
        dev.log('success');
      } else {
        setLoading(false);
        dev.log('fail');
      }
    } catch (e) {
      dev.log(e.toString());
    }
  }
}
