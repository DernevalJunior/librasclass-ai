import 'package:flutter/material.dart';

/// Placeholder do Player do Avatar.
/// Integração real com Unity: use flutter_unity_widget.
class AvatarPlayer extends StatelessWidget {
  final List<String> animations;
  const AvatarPlayer({super.key, required this.animations});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black12,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.accessibility_new, size: 56),
          const SizedBox(height: 8),
          const Text("Avatar LIA (Unity) — placeholder"),
          const SizedBox(height: 8),
          Text(
            animations.isEmpty ? "Nenhuma animação" : animations.join(" → "),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
