import 'package:flutter/material.dart';

class EveningAzkarScreen extends StatelessWidget {
  const EveningAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text("Evening Azkar"),
      ),
      backgroundColor: const Color(0xFF1A1A1A),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            "🌙 Evening Azkar\n\n- آية الكرسي\n- سورة الإخلاص\n- سورة الفلق\n- سورة الناس",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
