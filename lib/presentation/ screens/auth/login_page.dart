import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutor_app/presentation/provider/auth_provider.dart';
import 'register_page.dart';
import 'reset_password_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Đăng nhập")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: "Mật khẩu"), obscureText: true),
            const SizedBox(height: 20),
            authProvider.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () async {
                try {
                  await authProvider.login(emailController.text, passwordController.text);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Đăng nhập thành công!")));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Lỗi: $e")));
                }
              },
              child: const Text("Đăng nhập"),
            ),
            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen())),
              child: const Text("Chưa có tài khoản? Đăng ký"),
            ),
            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ResetPasswordScreen())),
              child: const Text("Quên mật khẩu?"),
            ),
          ],
        ),
      ),
    );
  }
}
