import 'package:flutter/material.dart';

class TutorHome extends StatelessWidget {
  const TutorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tutor Home")),
      body: const Center(
        child: Text("Welcome Tutor!"),
      ),
    );
  }
}
