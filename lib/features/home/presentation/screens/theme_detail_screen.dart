import 'package:flutter/material.dart';
import '../../data/mock_recommendation_data.dart';
import '../screens/detail_screen.dart';

class ThemeDetailScreen extends StatelessWidget {
  final String themeName;

  const ThemeDetailScreen({super.key, required this.themeName});

  @override
  Widget build(BuildContext context) {
    final picks = MockRecommendationData.picks;

    final relatedStocks = picks.where((item) {
      if (themeName == 'AI') {
        return item.name == 'SK하이닉스' ||
            item.name == '삼성전자' ||
            item.name == '한미반도체';
      }
      if (themeName == '반도체') {
        return item.name == 'SK하이닉스' || item.name == '삼성전자';
      }
      if (themeName == '2차전지') {
        return item.name == '에코프로' || item.name == '포스코퓨처엠';
      }
      if (themeName == '에너지') {
        return item.name == '한국가스공사' || item.name == 'S-Oil';
      }
      return false;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(themeName)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: relatedStocks.map((item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailScreen(item: item)),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '${item.score}점',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
