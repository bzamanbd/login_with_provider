import 'package:flutter/material.dart';
import 'package:login_with_provider/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'screens/login_screen.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider())
      ],
      child: const MaterialApp(
        title: 'loginApp',
        home: LoginScreen(),
      ),
    ));
