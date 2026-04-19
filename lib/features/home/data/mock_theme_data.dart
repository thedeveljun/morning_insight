class ThemeItem {
  final String name;
  final int strength;
  final String description;

  const ThemeItem({
    required this.name,
    required this.strength,
    required this.description,
  });
}

class MockThemeData {
  static const List<ThemeItem> themes = [
    ThemeItem(name: 'AI', strength: 95, description: 'AI 반도체 및 데이터센터 수요 증가'),
    ThemeItem(name: '반도체', strength: 90, description: '메모리 업황 회복 기대'),
    ThemeItem(name: '2차전지', strength: 75, description: '전기차 수요 증가 지속'),
    ThemeItem(name: '에너지', strength: 65, description: '유가 상승 영향'),
  ];

  static const Map<String, List<String>> themeStocks = {
    'AI': ['SK하이닉스', '삼성전자', '한미반도체'],
    '반도체': ['삼성전자', 'SK하이닉스'],
    '2차전지': ['에코프로', '포스코퓨처엠'],
    '에너지': ['한국가스공사', 'S-Oil'],
  };
}
