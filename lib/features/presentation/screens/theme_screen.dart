import 'package:flutter/material.dart';
import '../../data/mock_theme_data.dart';
import 'theme_detail_screen.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  Color _color(int strength) {
    if (strength >= 90) return Colors.green;
    if (strength >= 70) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final themes = MockThemeData.themes;

    return Scaffold(
      appBar: AppBar(title: const Text('테마 분석')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: themes.map((e) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ThemeDetailScreen(themeName: e.name),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        e.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${e.strength}',
                        style: TextStyle(
                          color: _color(e.strength),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(e.description),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
