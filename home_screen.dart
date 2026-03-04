import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LibrasClass AI")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Olá, Professor! 👋", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            _bigButton(context, "🎤 Traduzir", "/translator"),
            const SizedBox(height: 12),
            _bigButton(context, "📚 Minhas Aulas", "/lessons"),
            const SizedBox(height: 12),
            _bigButton(context, "📖 Dicionário (frases)", "/dictionary"),
            const SizedBox(height: 12),
            _bigButton(context, "⭐ Favoritos", "/favorites"),
          ],
        ),
      ),
    );
  }

  Widget _bigButton(BuildContext context, String label, String route) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, route),
        child: Text(label, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
