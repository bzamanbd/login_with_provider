import 'package:flutter/material.dart';
import 'package:login_with_provider/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataFromProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)
              .copyWith(top: 180.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Your email',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passController,
                  obscureText: dataFromProvider.isObscureText,
                  decoration: InputDecoration(
                      labelText: 'Your password',
                      suffix: IconButton(
                          onPressed: () => dataFromProvider.toggleObscureText(),
                          icon: dataFromProvider.isObscureText
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility))),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      dataFromProvider.login(
                        email: _emailController.text.toString(),
                        password: _passController.text.toString(),
                      );
                    },
                    child: dataFromProvider.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
