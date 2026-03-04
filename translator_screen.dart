import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../widgets/avatar_player.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({super.key});

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final _controller = TextEditingController(text: "Hoje vamos estudar frações");
  bool _loading = false;
  String _gloss = "";
  List<String> _animations = [];

  Future<void> _translate() async {
    setState(() => _loading = true);
    try {
      final api = context.read<ApiService>();
      final res = await api.translate(_controller.text);
      setState(() {
        _gloss = (res["gloss"] ?? "") as String;
        _animations = (res["animations"] as List<dynamic>).map((e) => e.toString()).toList();
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tradutor")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Digite uma frase",
                border: OutlineInputBorder(),
              ),
              minLines: 1,
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _loading ? null : _translate,
                icon: const Icon(Icons.translate),
                label: Text(_loading ? "Traduzindo..." : "Traduzir"),
              ),
            ),
            const SizedBox(height: 12),
            AvatarPlayer(animations: _animations),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("GLOSS:", style: Theme.of(context).textTheme.titleMedium),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(_gloss.isEmpty ? "-" : _gloss, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
