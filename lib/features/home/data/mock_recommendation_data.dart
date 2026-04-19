import '../domain/models/market_issue.dart';
import '../domain/models/stock_recommendation.dart';

class MockRecommendationData {
  static const List<MarketIssue> issues = [
    MarketIssue(
      title: 'AI 반도체 투자 확대',
      subtitle: '미국 빅테크 투자 증가',
      impact: '반도체 강세',
    ),
    MarketIssue(title: '국제유가 상승', subtitle: '에너지 업종 수혜', impact: '정유/LNG 상승'),
    MarketIssue(
      title: '전기차 시장 회복 기대',
      subtitle: '배터리 업종 반등 가능성',
      impact: '2차전지 관심',
    ),
  ];

  static const List<StockRecommendation> picks = [
    StockRecommendation(
      rank: '01',
      name: 'SK하이닉스',
      market: 'KOSPI',
      score: 94,
      reason: 'AI 메모리 수요 증가와 외국인 수급 유입이 강합니다.',
      risk: '단기 과열 가능성',
      expectedRange: 4.5,
    ),
    StockRecommendation(
      rank: '02',
      name: '삼성전자',
      market: 'KOSPI',
      score: 90,
      reason: '반도체 업황 회복 기대와 안정적인 대형주 수급이 긍정적입니다.',
      risk: '지수 조정 영향 가능성',
      expectedRange: 2.3,
    ),
    StockRecommendation(
      rank: '03',
      name: '한미반도체',
      market: 'KOSDAQ',
      score: 88,
      reason: 'AI 반도체 장비 수요 확대 기대가 반영되고 있습니다.',
      risk: '변동성 확대 가능성',
      expectedRange: 5.1,
    ),
    StockRecommendation(
      rank: '04',
      name: '에코프로',
      market: 'KOSDAQ',
      score: 78,
      reason: '2차전지 업종 반등 기대가 살아나고 있습니다.',
      risk: '테마 변동성 큼',
      expectedRange: 3.4,
    ),
    StockRecommendation(
      rank: '05',
      name: '포스코퓨처엠',
      market: 'KOSPI',
      score: 74,
      reason: '배터리 소재 수요 회복 기대가 작용하고 있습니다.',
      risk: '실적 모멘텀 확인 필요',
      expectedRange: 2.8,
    ),
    StockRecommendation(
      rank: '06',
      name: '한국가스공사',
      market: 'KOSPI',
      score: 69,
      reason: '에너지 가격 상승과 정책 기대가 반영될 수 있습니다.',
      risk: '원자재 가격 변동성',
      expectedRange: 2.2,
    ),
    StockRecommendation(
      rank: '07',
      name: 'S-Oil',
      market: 'KOSPI',
      score: 67,
      reason: '정유 업황 개선 기대와 유가 반등 이슈가 연결됩니다.',
      risk: '유가 급변 리스크',
      expectedRange: 2.0,
    ),
  ];
}
