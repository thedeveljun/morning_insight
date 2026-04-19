import 'package:flutter/material.dart';
import '../../data/mock_recommendation_data.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchText = '';
  String _sortType = 'score';

  Color _scoreColor(int score) {
    if (score >= 90) return Colors.green;
    if (score >= 70) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final issues = MockRecommendationData.issues;
    final allPicks = MockRecommendationData.picks;

    final filteredPicks = allPicks.where((item) {
      return item.name.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();

    if (_sortType == 'score') {
      filteredPicks.sort((a, b) => b.score.compareTo(a.score));
    } else if (_sortType == 'name') {
      filteredPicks.sort((a, b) => a.name.compareTo(b.name));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Morning Pick')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1D4ED8), Color(0xFF0F172A)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('오늘의 요약', style: TextStyle(color: Colors.white70)),
                SizedBox(height: 10),
                Text(
                  'AI·반도체 중심 상승 흐름\n강세 후보 5종목',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                hintText: '종목 검색',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ChoiceChip(
                label: const Text('점수순'),
                selected: _sortType == 'score',
                onSelected: (_) {
                  setState(() {
                    _sortType = 'score';
                  });
                },
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text('이름순'),
                selected: _sortType == 'name',
                onSelected: (_) {
                  setState(() {
                    _sortType = 'name';
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '오늘의 핵심 이슈',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...issues.map(
            (e) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(e.subtitle),
                      ],
                    ),
                  ),
                  Text(
                    e.impact,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '추천 종목',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          if (filteredPicks.isEmpty)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                '검색 결과가 없습니다.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ...filteredPicks.map(
            (e) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailScreen(item: e)),
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
                          e.rank,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          e.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${e.score}점',
                          style: TextStyle(
                            color: _scoreColor(e.score),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(e.reason),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
