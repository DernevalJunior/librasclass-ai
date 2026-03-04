import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/api_service.dart';
import 'screens/home_screen.dart';
import 'screens/translator_screen.dart';
import 'screens/lessons_screen.dart';
import 'screens/dictionary_screen.dart';
import 'screens/favorites_screen.dart';

void main() => runApp(const LibrasClassApp());

class LibrasClassApp extends StatelessWidget {
  const LibrasClassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (_) => ApiService(),
      child: MaterialApp(
        title: "LibrasClass AI",
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
        routes: {
          "/": (_) => const HomeScreen(),
          "/translator": (_) => const TranslatorScreen(),
          "/lessons": (_) => const LessonsScreen(),
          "/dictionary": (_) => const DictionaryScreen(),
          "/favorites": (_) => const FavoritesScreen(),
        },
      ),
    );
  }
}
