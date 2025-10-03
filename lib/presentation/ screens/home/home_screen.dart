import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutor_app/presentation/provider/auth_provider.dart';
import 'package:tutor_app/config/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trang chính"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authProvider.logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRouter.login,
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Xin chào, ${authProvider.user?.email ?? 'User'}!"),
      ),
    );
  }
}
